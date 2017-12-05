using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Http;

namespace Secure1.Models.BusinessViewModels
{
    public class UploadViewModel    {
		[Required]
		[Display(Name = "DisplayName")]
		public string DisplayName { get; set; }

		[Required]
		[Display(Name = "Desc")]
		public string Desc { get; set; } = "";

		[Required]
		[Display(Name = "Comment")]
		public string Comment { get; set; } = "";

		[Required]
		[Display(Name = "FilePath")]
		public List<IFormFile> FilePath { get; set; }

		public List<Secure1.DataBusiness.Version> ListOfVersions { get; set; }
	}
}
