using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace HCP_UserVetting.Data.Models
{
    public class Rule
    {
        private List<RuleCondition> _conditions;
        [Key]
        public long RuleId { get; set; }
        public string RuleDescription { get; set; }
        public bool IsActive { get; set; }

        public List<RuleCondition> Conditions
        {
            get
            {
                if (_conditions == null)
                {
                    _conditions = new List<RuleCondition>();
                }
                return _conditions;
            }
            set
            {
                _conditions = value;
            }
        }
    }
}