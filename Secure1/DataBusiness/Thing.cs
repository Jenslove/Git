using System;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Runtime.Serialization;

namespace Secure1.DataBusiness
{
    public partial class Thing
    {
		// TODO: Add Thing Removed flag field
		// TODO: Probably could delete size here as this is just the theoretical thing
		public Thing()
        {
            Version = new HashSet<Version>();
        }

        public decimal Id { get; set; }
        public decimal Project { get; set; }
        public DateTime CreateDate { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }
        public int Size { get; set; }
        public string Desc { get; set; }
        public string Comment { get; set; }
        public string Focus { get; set; }

		[JsonIgnore]
		public Project ProjectNavigation { get; set; }
		public ICollection<Version> Version { get; set; }
    }
}
