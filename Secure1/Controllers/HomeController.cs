using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Secure1.Models;
using System.Net.Mail;
using System.Text;
using System.Net;

namespace Secure1.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

		public IActionResult About() {
			ViewData["Message"] = "Your application description page.";

			//Services.EmailSender.SendEmailBlocking("michael.keena@geha.com", "Test Email","This is a test email!");

			//string toEmail = "michael.keena@geha.com";
			//string message = "Test Message - code in about.";
			//string subject = "This is the Test Subject";
			//MailMessage mail = new MailMessage() {
			//	From = new MailAddress("mike.keena@thekeenas.com", "Mike Keena")
			//};
			//mail.To.Add(new MailAddress(toEmail));
			////mail.CC.Add(new MailAddress(_emailSettings.CcEmail));
			//mail.Sender = new MailAddress("michael.keena@geha.com");
			//mail.Subject = "Blocking Test - " + subject;
			//mail.Body = message;
			//mail.IsBodyHtml = true;
			//mail.Priority = MailPriority.High;
			//mail.BodyEncoding = Encoding.UTF8;
			//mail.SubjectEncoding = Encoding.UTF8;
			//using (SmtpClient smtp = new SmtpClient("smtpout.secureserver.net", 465)) {
			//	smtp.EnableSsl = true;
			//	smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
			//	smtp.UseDefaultCredentials = false;
			//	smtp.Credentials = new NetworkCredential("mike.keena@thekeenas.com", "astrid");
			//	//smtp.Send(mail);
			//	try {
			//		smtp.Send(mail);
			//	} catch (Exception e) {
			//		throw e;
			//	}

			return View();
			//}
		}

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
