namespace HCP_UserVetting.Models
{
    public class AnswerModel
    {
        public long Id { get; set; }
        public long? ParentQuestionId { get; set; }
        public long? ResultQuestionId { get; set; }
        public string AnswerText { get; set; }
        public bool IsActive { get; set; }

        public QuestionModel ParentQuestion { get; set; }
        public QuestionModel ResultQuestion { get; set; }
    }
}