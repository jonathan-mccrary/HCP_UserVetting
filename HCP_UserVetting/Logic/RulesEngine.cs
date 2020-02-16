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
        private long _userId;
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

        public RulesEngine(HCP_DBContext dbContect, long userId)
        {
            _dbContext = dbContect;
            _userId = userId;
        }

        private List<MAP_User_Question_Response> GetUserQuestionResponses()
        {
            return _dbContext.QuestionResponses.Where(p => p.UserId == _userId)?.ToList();
        }


        private List<Rule> GetRules()
        {
            return _dbContext.Rules.Where(p => p.IsActive == true).ToList(); ;
        }
    }
}
