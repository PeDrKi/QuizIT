using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using QuizIT.Common.Models;
using QuizIT.Service.IServices;
using QuizIT.Service.Entities;
using QuizIT.Web.Filter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Net;
using System.Text.RegularExpressions;
using QuizIT.Service.Services;
using Microsoft.Extensions.Configuration;
using MimeKit;
using MailKit.Net.Smtp;
namespace QuizIT.Web.Controllers
{
    public class AuthenticateController : Controller
    {
        private readonly IAuthenticateService authenticateService;
        private readonly IConfiguration _configuration;

        public AuthenticateController(IAuthenticateService authenticateService
            , IConfiguration configuration)
        {
            this.authenticateService = authenticateService;
            _configuration = configuration;
        }

        [Route("/")]
        [AuthorizationFilter(IsAuthoriaztion = false)]
        public IActionResult Login()
        {
            //Nếu đã đăng nhập r
            if (CurrentUser.Id != -1)
            {
                return Redirect("~/bo-de");
            }
            return View();
        }

        [Route("/registry")]
        [AuthorizationFilter(IsAuthoriaztion = false)]
        public IActionResult Registry()
        {
            return View();
        }

        #region CÁC SỰ KIỆN
        [HttpPost]
        [AuthorizationFilter(IsAuthoriaztion = false)]
        public async Task<IActionResult> EventLogin(User user)
        {
            var resService = await authenticateService.Login(user.UserName, user.Password);

            if (resService.ResponseCode == ResponseCode.SUCCESS)
            {
                user = resService.Result.FirstOrDefault();
                
                if (!user.IsActive)
                {
                    resService.Result = null;
                    resService.ResponseCode = ResponseCode.NOT_FOUND;
                    resService.ResponseMess = "Tài khoản hiện chưa kích hoạt !";
                    return Json(resService);
                } 

                await SetCookieAuthenticate(user);
            }

            //Reset lại kết quả để tránh gửi 1 object bị đệ quy xuống js
            resService.Result = null;
            return Json(resService);
        }

        [HttpPost]
        [AuthorizationFilter(IsAuthoriaztion = false)]
        public async Task<IActionResult> EventRegistry(User user)
        {
            var res = await authenticateService.Register(user);
            
            if (res.ResponseCode == ResponseCode.SUCCESS)
            {
                if (!string.IsNullOrEmpty(user.Email))
                {
                    var token = await authenticateService.GenerateEmailConfirmationTokenAsync(user);

                    var callbackUrl = Url.Action(
                    "ConfirmEmail",
                    "Authenticate",
                    new { userId = user.Id, token },
                    Request.Scheme);

                    try
                    {
                        await SendEmailAsync(user.Email, "Confirm Your Email", $"Please confirm your account by <a href='{callbackUrl}'>clicking here</a>.");
                        
                        ServiceResult<string> resultService = new ServiceResult<string>
                        {
                            ResponseCode = ResponseCode.SUCCESS,
                            ResponseMess = "Đăng ký thành công, vui lòng kiểm tra email để kích hoạt tài khoản !"
                        };

                        return Json(resultService);
                    }
                    catch (Exception ex)
                    {
                        ServiceResult<string> resultService = new ServiceResult<string>
                        {
                            ResponseCode = ResponseCode.INTERNAL_SERVER_ERROR,
                            ResponseMess = "Lỗi gửi mail kích hoạt, vui lòng liên hệ với quản trị viên để báo cáo sự cố !"
                        };

                        return Json(resultService);
                    }
                }
            }
            return Json(res);
        }

        

        private async Task SendEmailAsync(string email, string subject, string message)
        {
            using (MimeMessage emailMessage = new MimeMessage())
            {
                MailboxAddress emailFrom = new MailboxAddress("Quiz Web"
                    , _configuration["Email:Smtp:Username"]);
                emailMessage.From.Add(emailFrom);
                MailboxAddress emailTo = new MailboxAddress(email, email);
                emailMessage.To.Add(emailTo);
                emailMessage.Subject = subject;
                BodyBuilder emailBodyBuilder = new BodyBuilder();
                emailBodyBuilder.TextBody = message;
                emailMessage.Body = emailBodyBuilder.ToMessageBody();
                using (SmtpClient mailClient = new SmtpClient())
                {
                    await mailClient.ConnectAsync(_configuration["Email:Smtp:Host"]
                        , Convert.ToInt32(_configuration["Email:Smtp:Port"])
                        , MailKit.Security.SecureSocketOptions.StartTls);
                    await mailClient.AuthenticateAsync(_configuration["Email:Smtp:Username"]
                        , _configuration["Email:Smtp:Password"]);
                    await mailClient.SendAsync(emailMessage);
                    await mailClient.DisconnectAsync(true);
                }
            }
        }

        [HttpGet]
        public async Task<IActionResult> ConfirmEmail(int userId, string token)
        {
            
            var result = await authenticateService.ConfirmEmailAsync(userId, token);

            if (!result)
            {
                ViewData["Message"] = "Email confirmation failed.";
                return RedirectToAction("Login");
            }

            ViewData["Message"] = "Email confirmed successfully!";
            return RedirectToAction("Login");
        }

        private async Task SetCookieAuthenticate(User user)
        {
            var claims = new List<Claim>
            {
                new Claim (ClaimTypes.Sid, Guid.NewGuid().ToString()),
                new Claim (ClaimTypes.NameIdentifier, user.Id.ToString()),
                new Claim (ClaimTypes.Name, user.FullName),
                new Claim (ClaimTypes.Role, user.RoleId.ToString()),
            };

            var claimsIdentity = new ClaimsIdentity(claims, "Login");
            await HttpContext.SignInAsync(
                CookieAuthenticationDefaults.AuthenticationScheme,
                new ClaimsPrincipal(claimsIdentity),
                new AuthenticationProperties
                {
                    ExpiresUtc = DateTime.UtcNow.AddDays(2),
                    IsPersistent = true
                }
             );
        }

        [HttpPost]
        public async Task EventLogout()
        {
            await HttpContext.SignOutAsync();
        }

        #endregion
    }
}