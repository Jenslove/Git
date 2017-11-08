using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Secure1.Services
{
    public interface IEmailSender
    {
        Task SendEmailAsync(string ToEmail, string Subject, string Message);
    }
}
