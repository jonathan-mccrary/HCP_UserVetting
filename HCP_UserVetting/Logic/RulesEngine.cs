using System;
using HCP_UserVetting.Data;
using System.Collections.Generic;
using HCP_UserVetting.Data.Models;
using System.Linq;

namespace HCP_UserVetting.Logic
{
    public class RulesEngine
    {
        private HCP_DBContext _dbContext;
        private User _user;
        private List<MAP_User_Question_Response> _questionResponses;
        private List<Rule> _rules;

        public List<Rule> Rules
        {
            get
            {
                if (_rules == null)
                {
                    _rules = new List<Rule>();
                }
                return _rules;
            }
            set
            {
                _rules = value;
            }
        }

        public List<MAP_User_Question_Response> QuestionResponses
        {
            get
            {
                if (_questionResponses == null)
                {
                    _questionResponses = new List<MAP_User_Question_Response>();
                }
                return _questionResponses;
            }
        }

        public RulesEngine(HCP_DBContext dbContext)
        {
            _dbContext = dbContext;
        }


        public bool DoesUserPassRules(long userId)
        {
            bool retVal = true;
            _user = _dbContext.Users.FirstOrDefault(p => p.UserId == userId);
            _questionResponses = this.GetUserQuestionResponses(userId);
            _rules = GetRules();
            List<RuleCondition> conditions = new List<RuleCondition>();
            foreach (var rule in _rules)
            {
                rule.Conditions = this.GetRuleConditionsForRule(rule.RuleId);
                conditions.AddRange(rule.Conditions);
            }

            foreach (var condition in conditions)
            {
                var result = _questionResponses.FirstOrDefault(p => p.QuestionId == condition.QuestionId);
                if (result == null || (condition.ExpectedResult == result.Response))
                {
                    retVal = false;
                    break;
                }
            }

            _user.Vetted = retVal;
            _user.Passed = retVal;
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
