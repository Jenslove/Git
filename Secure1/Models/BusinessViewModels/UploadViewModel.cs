using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Http;

namespace Secure1.Models.BusinessViewModels
{
    public class UploadViewModel    {
		[Required]
		[Display(Name = "Name")]
		public string Name { get; set; }

		[Required]
		[Display(Name = "Age")]
		public int Age { get; set; }

		[Required]
		[Display(Name = "Zipcode")]
		public int Zipcode { get; set; }

		[Required]
		[Display(Name = "FilePath")]
		public List<IFormFile> FilePath { get; set; }
	}
}
