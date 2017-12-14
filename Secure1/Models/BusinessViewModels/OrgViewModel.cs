using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Secure1.Models.BusinessViewModels
{
    public class OrgViewModel {
		public decimal Id { get; set; }
		public string OrgName { get; set; }
		public DateTime CreateDate { get; set; }
		public string Address1 { get; set; }
		public string Address2 { get; set; }
		public string City { get; set; }
		public string State { get; set; }
		public string Zip { get; set; }
		public string Telephone { get; set; }
		public string Email { get; set; }

		//public ICollection<ProjectViewModel> Projects { get; set; }
		public ICollection<UserViewModel> Users { get; set; }
	}
}
