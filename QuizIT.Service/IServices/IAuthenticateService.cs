using QuizIT.Common.Models;
using QuizIT.Service.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace QuizIT.Service.IServices
{
    public interface IAuthenticateService
    {
        Task<bool> ConfirmEmailAsync(int userId, string token);
        Task<string> GenerateEmailConfirmationTokenAsync(User user);
        Task<ServiceResult<User>> Login(string userName, string password);

        Task<ServiceResult<string>> Register(User user);
    }
}
