using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Secure1.Models.UniversalModels
{
	/// <summary>
	/// Environment configuration for email server options
	/// </summary>
	public class EmailOptions {
		/// <summary>
		/// Gets or sets a value indicating whether [use SSL].
		/// </summary>
		/// <value>
		///   <c>true</c> if [use SSL]; otherwise, <c>false</c>.
		/// </value>
		public bool UseSsl { get; set; }

		/// <summary>
		/// Gets or sets the port.
		/// </summary>
		/// <value>
		/// The port.
		/// </value>
		public int Port { get; set; }

		/// <summary>
		/// Gets or sets from email address.
		/// </summary>
		/// <value>
		/// From email address.
		/// </value>
		public string FromEmailAddress { get; set; }

		/// <summary>
		/// Gets or sets to email address.
		/// </summary>
		/// <value>
		/// To email address.
		/// </value>

		public string FromEmailAddressFriendlyName { get; set; }

		/// <summary>
		/// Gets or sets to email address.
		/// </summary>
		/// <value>
		/// To email address.
		/// </value>

		public string ToEmailAddress { get; set; }
		/// <summary>
		/// Gets or sets the domain URL.
		/// </summary>
		/// <value>
		/// The domain URL.
		/// </value>
		public string ToEmailAddressFriendlyName { get; set; }

		/// <summary>
		/// Gets or sets the domain URL.
		/// </summary>
		/// <value>
		/// The domain URL.
		/// </value>
		public string DomainUrl { get; set; }

		/// <summary>
		/// Gets or sets the SMTP address.
		/// </summary>
		/// <value>
		/// The SMTP address.
		/// </value>
		public string SmtpAddress { get; set; }

		public bool UseDefaultCredentials { get; set; }
		public string CredentialID { get; set; }
		public string CredentialPW { get; set; }

	}
}
