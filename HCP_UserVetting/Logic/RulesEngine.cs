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
            bool retVal = true;
            var user = _dbContext.Users.FirstOrDefault(p => p.UserId == userId);
            var questionResponses = this.GetUserQuestionResponses(userId);
            var rules = GetRules();
            List<RuleCondition> conditions = new List<RuleCondition>();
            foreach (var rule in rules)
            {
                rule.Conditions = this.GetRuleConditionsForRule(rule.RuleId);
                conditions.AddRange(rule.Conditions);
            }

            foreach (var condition in conditions)
            {
                var result = questionResponses.FirstOrDefault(p => p.QuestionId == condition.QuestionId);
                if (result == null || (condition.ExpectedResult == result.Response))
                {
                    retVal = false;
                    break;
                }
            }

            user.Vetted = retVal;
            user.Passed = retVal;
            _dbContext.SaveChanges();

            return retVal;
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
