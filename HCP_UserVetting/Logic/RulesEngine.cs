using System.Collections.Generic;
using System.Linq;
using HCP_UserVetting.Data;
using HCP_UserVetting.Data.Models;

namespace HCP_UserVetting.Logic
{
    public class RulesEngine
    {
        private HCP_DBContext _dbContext;
        public RulesEngine(HCP_DBContext dbContext)
        {
            _dbContext = dbContext;
        }

        public bool RunRulesEngineOnUser(long userId)
        {
            bool passed = true;
            var user = _dbContext.Users.FirstOrDefault(p => p.UserId == userId);
            var questionResponses = this.GetUserQuestionResponses(userId);
            var rules = GetRules();
            foreach (var rule in rules)
            {
                rule.Conditions = this.GetRuleConditionsForRule(rule.RuleId);
                if (rule.Conditions == null || rule.Conditions.Count == 0)
                {
                    continue;
                }
                List<bool> results = new List<bool>();
                foreach (var condition in rule.Conditions)
                {
                    var answer = questionResponses.FirstOrDefault(p => p.QuestionId == condition.QuestionId);
                    results.Add(answer == null || (condition.ExpectedResult == answer.Response));
                }
                passed = results.Contains(false);
                if (passed == false)
                {
                    break;
                }
            }

            user.Vetted = true;
            user.Passed = passed;
            _dbContext.SaveChanges();

            return passed;
        }

        private List<MAP_User_Question_Response> GetUserQuestionResponses(long userId)
        {
            return _dbContext.QuestionResponses.Where(p => p.UserId == userId)?.ToList();
        }


        private List<Rule> GetRules()
        {
            return _dbContext.Rules.Where(p => p.IsActive == true).ToList(); ;
        }

        private List<RuleCondition> GetRuleConditionsForRule(long ruleId)
        {
            return _dbContext.RuleConditions.Where(p => p.IsActive == true && p.RuleId == ruleId).ToList();
        }
    }
}
