using System.ComponentModel.DataAnnotations;

namespace HCP_UserVetting.Data.Models
{
    public class User
    {
        [Key]
        public long UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string EmailAddress { get; set; }
        public bool Vetted { get; set; }
        public bool Passed { get; set; }

    }
}