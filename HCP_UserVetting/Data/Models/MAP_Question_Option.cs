using System.ComponentModel.DataAnnotations;

namespace HCP_UserVetting.Data.Models
{
    public class MAP_Question_Option
    {
        [Key]
        public long QuestionOptionId { get; set; }
        public long QuestionId { get; set; }
        public long OptionId { get; set; }
    }
}