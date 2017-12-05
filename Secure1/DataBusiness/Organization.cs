using System;
using System.Collections.Generic;

namespace Secure1.DataBusiness
{
    public partial class Organization
    {
        public Organization()
        {
            Project = new HashSet<Project>();
            User = new HashSet<User>();
        }

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

        public ICollection<Project> Project { get; set; }
        public ICollection<User> User { get; set; }
    }
}
