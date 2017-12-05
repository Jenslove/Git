using System;
using System.Collections.Generic;

namespace Secure1.DataBusiness
{
    public partial class Thing
    {
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

        public Project ProjectNavigation { get; set; }
        public ICollection<Version> Version { get; set; }
    }
}
