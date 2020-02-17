using System.Collections.Generic;
using HCP_UserVetting.Data.Models;

namespace HCP_UserVetting.Models
{
    public class QuestionModel
    {
        private List<AnswerOption> _options;

        public long QuestionId { get; set; }
        public string QuestionText { get; set; }
        public int QuestionNumber { get; set; }
        public int SubQuestionNumber { get; set; }
        public long? ParentQuestionId { get; set; }
        public string ParentAnswerValue { get; set; }
        public bool FreeForm { get; set; }
        public bool IsActive { get; set; }

        public string Answer { get; set; }
        public bool IsVisible { get; set; }

        public List<AnswerOption> Options
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