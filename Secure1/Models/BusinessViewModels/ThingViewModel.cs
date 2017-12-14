using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Secure1.Models.BusinessViewModels
{
    public class ThingViewModel {
		public decimal Id { get; set; }
		public decimal Project { get; set; }
		public DateTime CreateDate { get; set; }
		public string Name { get; set; }
		public string Type { get; set; }
		public int Size { get; set; }
		public string Desc { get; set; }
		public string Comment { get; set; }
		public string Focus { get; set; }

		//public ProjectViewModel Project { get; set; }
		public ICollection<Version> Versions { get; set; }
	}
}
