using QuizIT.Common;
using QuizIT.Common.Helpers;
using QuizIT.Common.Models;
using QuizIT.Service.IServices;
using QuizIT.Service.Entities;
using System.Linq;
using System.Threading.Tasks;
using System;
using Microsoft.EntityFrameworkCore;
using System.Text.RegularExpressions;

namespace QuizIT.Service.Services
{
    public class AuthenticateService : IAuthenticateService
    {
        private readonly QuizITContext _dbContext;

        public AuthenticateService(QuizITContext dbContext)
        {
            _dbContext = dbContext;
        }

        private readonly string LOGIN_SUCCESS_MESS = "Chào mừng";
        private readonly string LOGIN_FAILED_MESS = "Sai thông tin đăng nhập";
        private readonly string REGISTRY_SUCCESS_MESS = "Đăng ký thành công";
        private readonly string REGISTRY_EXISTS_USER_NAME = "Tên đăng nhập đã bị trùng, vui lòng nhập tên đăng nhập khác";
        private readonly string EMAIL_IS_NOT_VALID = "Địa chỉ email không hợp lệ";
        public async Task<ServiceResult<User>> Login(string userName, string password)
        {
            ServiceResult<User> resultService = new ServiceResult<User>
            {
                ResponseCode = ResponseCode.SUCCESS,
                ResponseMess = LOGIN_SUCCESS_MESS
            };
            try
            {
                User user = await _dbContext.User
                     .FirstOrDefaultAsync(u =>
                         u.UserName.ToLower() == userName.ToLower() /* &&
                         u.Password == MD5Helper.Encode(password) */
                      );
                if (user == null)
                {
                    return new ServiceResult<User>
                    {
                        ResponseCode = ResponseCode.BAD_REQUEST,
                        ResponseMess = LOGIN_FAILED_MESS
                    };
                }
                resultService.Result.Add(user);
            }
            catch
            {
                resultService.ResponseCode = ResponseCode.INTERNAL_SERVER_ERROR;
                resultService.ResponseMess = ResponseMessage.INTERNAL_SERVER_ERROR;
            }

            return resultService;
        }


        private bool isEmail(string emailString)
        {
            return Regex.IsMatch(emailString, @"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z", RegexOptions.IgnoreCase);
        }

        public async Task<ServiceResult<string>> Register(User user)
        {
            ServiceResult<string> resultService = new ServiceResult<string>
            {
                ResponseCode = ResponseCode.SUCCESS,
                ResponseMess = REGISTRY_SUCCESS_MESS
            };
            try
            {
                if (string.IsNullOrWhiteSpace(user.Email) 
                    || !isEmail(user.Email))
                {
                    return new ServiceResult<string>
                    {
                        ResponseCode = ResponseCode.BAD_REQUEST,
                        ResponseMess = EMAIL_IS_NOT_VALID
                    };
                }

                //Kiểm tra userName đã tồn tại trong DB hay chưa
                bool isExistsUserName = (_dbContext.User
                    .FirstOrDefault(u => u.UserName.ToLower() == user.UserName.ToLower()) != null);
                if (isExistsUserName)
                {
                    return new ServiceResult<string>
                    {
                        ResponseCode = ResponseCode.BAD_REQUEST,
                        ResponseMess = REGISTRY_EXISTS_USER_NAME
                    };
                }
                user.RoleId = Constant.Role.CLIENT;
                user.Password = MD5Helper.Encode(user.Password);
                user.IsActive = false;
                await _dbContext.User.AddAsync(user);
                await _dbContext.SaveChangesAsync();
            }
            catch
            {
                resultService.ResponseCode = ResponseCode.INTERNAL_SERVER_ERROR;
                resultService.ResponseMess = ResponseMessage.INTERNAL_SERVER_ERROR;
            }

            return resultService;
        }

        public async Task<string> GenerateEmailConfirmationTokenAsync(User user)
        {
            var dbUser = _dbContext.User.FirstOrDefault(u => u.Id == user.Id);

            if (dbUser == null)
            {
                return null;
            }

            string token = Guid.NewGuid().ToString();
            dbUser.ConfirmToken = token;
            dbUser.IsActive = false;

            _dbContext.User.Update(dbUser);
            await _dbContext.SaveChangesAsync();
            return token;
        }

        public async Task<bool> ConfirmEmailAsync(int userId, string token)
        {
            var user = await _dbContext.User.FindAsync(userId);

            if (user == null)
            {
                return false;
            }

            var result = user.ConfirmToken == token;

            if (result)
            {
                user.IsActive = true;
                user.ConfirmToken = null;
                _dbContext.User.Update(user);
                await _dbContext.SaveChangesAsync();
            }

            return result;
        }
    }
}