using System;

namespace HCP_UserVetting.Models
{
    public class UserQuestionModel
    {
        public long Id { get; set; }
        public long UserId { get; set; }
        public long QuestionId { get; set; }
        public long? AnswerId { get; set; }
        public DateTime InsertDate { get; set; }
        public DateTime? UpdateDate { get; set; }

        public UserModel User { get; set; }
        public QuestionModel Question { get; set; }
        public AnswerModel Answer { get; set; }
    }
}