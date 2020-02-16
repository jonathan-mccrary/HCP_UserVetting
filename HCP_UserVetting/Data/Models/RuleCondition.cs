using System.ComponentModel.DataAnnotations;

namespace HCP_UserVetting.Data.Models
{
    public class RuleCondition
    {
        [Key]
        public long ConditionId { get; set; }
        public long RuleId { get; set; }
        public long QuestionId { get; set; }
        public string ExpectedResult { get; set; }
        public bool IsActive { get; set; }
    }
}