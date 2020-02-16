using System.Collections.Generic;

namespace HCP_UserVetting.Models
{
    public class QuestionModel
    {
        public long Id { get; set; }
        public string QuestionText { get; set; }
        public bool IsActive { get; set; }
        public int Sequence { get; set; }

        public List<AnswerModel> Answers { get; set; }
    }
}