using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Secure1.Models.BusinessViewModels
{
    public class Org {
		[Required]
		[EmailAddress]
		[Display(Name = "Email")]
		public string Email { get; set; }

		[Required]
		[StringLength(100, ErrorMessage = "The {0} must be at least {2} and at max {1} characters long.", MinimumLength = 6)]
		[DataType(DataType.Password)]
		[Display(Name = "Password")]
		public string Password { get; set; }

		[DataType(DataType.Password)]
		[Display(Name = "Confirm password")]
		[Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
		public string ConfirmPassword { get; set; }

		[Required]
		[EmailAddress]
		public string iEmail { get; set; }

		[Required]
		[DataType(DataType.Password)]
		public string iPassword { get; set; }

		[Display(Name = "Remember me?")]
		public bool RememberMe { get; set; }

		//	[ID]       NUMERIC(18) IDENTITY(1, 1) NOT NULL PRIMARY KEY,
		//[OrgName]      VARCHAR(150)   NOT NULL,
		// [CreateDate]  DATETIME NOT NULL,
		//[Address1]     VARCHAR(150)   NOT NULL,
		//[Address2]     VARCHAR(150)   NULL,
		//[City]         VARCHAR(75)    NOT NULL,
		//[State]        VARCHAR(2)     NOT NULL,
		//[Zip]       VARCHAR(10)       NOT NULL,
		//[Telephone]    VARCHAR(15)    NULL,
		//[Email]        VARCHAR(75)    NULL
	}
}
