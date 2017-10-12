using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace Secure1.Services
{
    // This class is used by the application to send email for account confirmation and password reset.
    // For more details see https://go.microsoft.com/fwlink/?LinkID=532713
    public class EmailSender : IEmailSender
    {
        public Task SendEmailAsync(string email, string subject, string message)
        {
			//return Task.CompletedTask;
			//try {
				string toEmail = email;
				MailMessage mail = new MailMessage() {
					From = new MailAddress("mike.keena@thekeenas.com", "Mike Keena")
				};
				mail.To.Add(new MailAddress(toEmail));
			//mail.CC.Add(new MailAddress(_emailSettings.CcEmail));
				mail.Sender = new MailAddress("mike.keena@thekeenas.com");
				mail.Subject = "Test - " + subject;
				mail.Body = message;
				mail.IsBodyHtml = true;
				mail.Priority = MailPriority.High;
				mail.BodyEncoding = Encoding.UTF8;
				mail.SubjectEncoding = Encoding.UTF8;
				using (SmtpClient smtp = new SmtpClient("smtpout.secureserver.net", 465)) {
					smtp.EnableSsl = true;
					smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
					smtp.UseDefaultCredentials = false;
					smtp.Credentials = new NetworkCredential("mike.keena@thekeenas.com", "astrid");
					//smtp.Send(mail);
					return smtp.SendMailAsync(mail);
				}
			//} catch (Exception ex) {
				//do something here
			//}
		}
    }
}
