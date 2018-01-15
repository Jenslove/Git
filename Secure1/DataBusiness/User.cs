using System;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Runtime.Serialization;

namespace Secure1.DataBusiness
{
    public partial class User
    {
        public User()
        {
            Project = new HashSet<Project>();
        }

        public decimal Id { get; set; }
        public decimal? Organization { get; set; }
        public DateTime CreateDate { get; set; }
        public string UserId { get; set; }
        public string FirstName { get; set; }
        public string MidName { get; set; }
        public string LastName { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public string Telephone { get; set; }
        public string Email { get; set; }
        public string Question1 { get; set; }
        public string Answer1 { get; set; }
        public string Question2 { get; set; }
        public string Answer2 { get; set; }
        public string Question3 { get; set; }
        public string Answer3 { get; set; }
        public string Ccnumber { get; set; }
        public string Ccaddress1 { get; set; }
        public string Ccaddress2 { get; set; }
        public string Cccity { get; set; }
        public string Ccstate { get; set; }
        public string Cczip { get; set; }

		[JsonIgnore]
		public Organization OrganizationNavigation { get; set; }
        public ICollection<Project> Project { get; set; }
    }
}
