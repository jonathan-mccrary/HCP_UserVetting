using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace HCP_UserVetting.Data.Models
{
    public class Question
    {
        private IList<AnswerOption> _options;

        [Key]
        public long QuestionId { get; set; }
        public string QuestionText { get; set; }
        public int QuestionNumber { get; set; }
        public int SubQuestionNumber { get; set; }
        public long ParentQuestionId { get; set; }
        public string ParenteAnswerValue { get; set; }
        public bool FreeForm { get; set; }
        public bool IsActive { get; set; }

        public IList<AnswerOption> Options
        {
            get
            {
                if (_options == null)
                {
                    _options = new List<AnswerOption>();
                }
                return _options;
            }
            set
            {
                _options = value;
            }
        }
    }
}