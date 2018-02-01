using System;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Runtime.Serialization;

namespace Secure1.DataBusiness
{
    public partial class Project
    {
        public Project()
        {
            Thing = new HashSet<Thing>();
        }
		// TODO: Add Project Name field
		// TODO: Add Project Removed flag field

		public decimal Id { get; set; }
        public decimal User { get; set; }
        public decimal? Organization { get; set; }
        public DateTime CreateDate { get; set; }
        public string Type { get; set; }
        public string Desc { get; set; }
        public string Comment { get; set; }
        public string Industry { get; set; }

		[JsonIgnore]
		public Organization OrganizationNavigation { get; set; }
		[JsonIgnore]
		public User UserNavigation { get; set; }
        public ICollection<Thing> Thing { get; set; }
    }
}
