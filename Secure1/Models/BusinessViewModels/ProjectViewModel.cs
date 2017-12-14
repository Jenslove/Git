using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Secure1.Models.BusinessViewModels
{
    public class ProjectViewModel {
		public decimal Id { get; set; }
		public decimal User { get; set; }
		public decimal? Organization { get; set; }
		public DateTime CreateDate { get; set; }
		public string Type { get; set; }
		public string Desc { get; set; }
		public string Comment { get; set; }
		public string Industry { get; set; }

		//public Organization OrganizationNavigation { get; set; }
		//public User UserNavigation { get; set; }
		//public ICollection<Thing> Thing { get; set; }
		//public OrgViewModel OrganizationNavigation { get; set; }
		//public UserViewModel User { get; set; }
		//public ICollection<ThingViewModel> Things { get; set; }

	}
}
