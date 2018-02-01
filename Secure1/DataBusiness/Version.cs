using System;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Runtime.Serialization;

namespace Secure1.DataBusiness
{
    public partial class Version
    {
		// TODO: Add Version Removed flag field
		public decimal Id { get; set; }
        public decimal Thing { get; set; }
        public DateTime CreateDate { get; set; }
        public string DisplayName { get; set; }
        public string Name { get; set; }
        public string FullPath { get; set; }
        public string FileType { get; set; }
        public int Size { get; set; }
        public string Desc { get; set; }
        public string Comment { get; set; }
		[JsonIgnore]
		public byte[] Item { get; set; }

		[JsonIgnore]
		public Thing ThingNavigation { get; set; }
    }
}
