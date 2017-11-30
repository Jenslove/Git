using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Http;

namespace Secure1.Models.BusinessViewModels
{
    public class VersionViewModel {
		[Required]
		[Display(Name = "ID")]
		public long ID { get; set; }
		[Required]
		[Display(Name = "Thing")]
		public long Thing { get; set; }
		[Required]
		[Display(Name = "CreateDate")]
		public DateTime CreateDate { get; set; }
		[Required]
		[Display(Name = "DisplayName")]
		public string DisplayName { get; set; }
		[Required]
		[Display(Name = "Name")]
		public string Name { get; set; }
		[Required]
		[Display(Name = "FullPath")]
		public string FullPath { get; set; }
		[Required]
		[Display(Name = "FileType")]
		public string FileType { get; set; }
		[Required]
		[Display(Name = "Size")]
		public int Size { get; set; }
		[Required]
		[Display(Name = "Desc")]
		public string Desc { get; set; }
		[Required]
		[Display(Name = "Comment")]
		public string Comment { get; set; }
		[Required]
		[Display(Name = "Item")]
		public byte[] Item { get; set; }
	}
}
