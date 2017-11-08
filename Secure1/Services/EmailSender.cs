using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.Options;
using Secure1.Models.UniversalModels;
using Serilog;

namespace Secure1.Services
{
    // This class is used by the application to send email for account confirmation and password reset.
    // For more details see https://go.microsoft.com/fwlink/?LinkID=532713
    public class EmailSender : IEmailSender
    {
		private readonly EmailOptions _emailOptions;
		public EmailSender(IOptions<EmailOptions> emailOptions) {
			_emailOptions = emailOptions.Value;
		}
        public Task SendEmailAsync(string ToEmail, string Subject, string Message)
        {
				MailMessage mail = new MailMessage() {
					From = new MailAddress(_emailOptions.FromEmailAddress, _emailOptions.FromEmailAddressFriendlyName)
				};
				mail.To.Add(new MailAddress(ToEmail));
				//mail.CC.Add(new MailAddress(_emailSettings.CcEmail));
				mail.Sender = new MailAddress(_emailOptions.FromEmailAddress);  //("mike.keena@thekeenas.com");
				mail.Subject = "Test - " + Subject;
				mail.Body = Message;
				mail.IsBodyHtml = true;
				mail.Priority = MailPriority.High;
				mail.BodyEncoding = Encoding.UTF8;
				mail.SubjectEncoding = Encoding.UTF8;
				//using (SmtpClient smtp = new SmtpClient("smtp.GEHA.com", 25)) { //("smtpout.secureserver.net", 465)) { //the function is broken, can't use using for now, https://github.com/dotnet/corefx/pull/24521
				SmtpClient smtp = new SmtpClient(_emailOptions.SmtpAddress, _emailOptions.Port); //("smtpout.secureserver.net", 465)) {
				smtp.EnableSsl = _emailOptions.UseSsl;
				smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
				smtp.UseDefaultCredentials = false;
				//smtp.Credentials = new NetworkCredential("mike.keena@thekeenas.com", "astrid");
				//smtp.Send(mail);
				try {
					Log.Debug("EmailSender");
					return smtp.SendMailAsync(mail);
				}catch(Exception e) {
					throw e;
				}
			}

		public void SendEmailBlocking(string ToEmail, string Subject, string Message) {
			MailMessage mail = new MailMessage() {
				From = new MailAddress(_emailOptions.FromEmailAddress, _emailOptions.FromEmailAddressFriendlyName)
			};
			mail.To.Add(new MailAddress(ToEmail));
			//mail.CC.Add(new MailAddress(_emailSettings.CcEmail));
			mail.Sender = new MailAddress(_emailOptions.FromEmailAddress);  //("mike.keena@thekeenas.com");
			mail.Subject = "Test - " + Subject;
			mail.Body = Message;
			mail.IsBodyHtml = true;
			mail.Priority = MailPriority.High;
			mail.BodyEncoding = Encoding.UTF8;
			mail.SubjectEncoding = Encoding.UTF8;
			//using (SmtpClient smtp = new SmtpClient("smtp.GEHA.com", 25)) { //("smtpout.secureserver.net", 465)) { //the function is broken, can't use using for now, https://github.com/dotnet/corefx/pull/24521
			SmtpClient smtp = new SmtpClient(_emailOptions.SmtpAddress, _emailOptions.Port); //("smtpout.secureserver.net", 465)) {
			smtp.EnableSsl = _emailOptions.UseSsl;
			smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
			smtp.UseDefaultCredentials = false;
			//smtp.Credentials = new NetworkCredential("mike.keena@thekeenas.com", "astrid");
			//smtp.Send(mail);
			try {
				smtp.Send(mail);
			} catch (Exception e) {
				throw e;
			}
		}
	}
}
