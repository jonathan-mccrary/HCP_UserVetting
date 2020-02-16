using System.ComponentModel.DataAnnotations;

namespace HCP_UserVetting.Data.Models
{
    public class MAP_User_Question_Response
    {
        [Key]
        public long QuestionResponsId { get; set; }
        public long UserId { get; set; }
        public long QuestionId { get; set; }
        public string Response { get; set; }
    }
}