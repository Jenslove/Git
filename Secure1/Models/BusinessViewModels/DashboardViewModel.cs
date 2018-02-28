using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Secure1.Models.BusinessViewModels
{
    public class DashboardViewModel {
		public UserViewModel User { get; set; }
    }
	public class ArchiveInbound {
		public string InType { get; set; }
		public int Id { get; set; }
		public bool Archive { get; set; }
	}
}
