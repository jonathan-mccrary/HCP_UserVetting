using System.ComponentModel.DataAnnotations;

namespace HCP_UserVetting.Data.Models
{
    public class AnswerOption
    {
        [Key]
        public long OptionId { get; set; }
        public string OptionValue { get; set; }
        public string OptionType { get; set; }
    }
}