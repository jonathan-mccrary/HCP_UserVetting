using System.Collections.Generic;
using System.Linq;
using HCP_UserVetting.Data.Models;
using HCP_UserVetting.Logic;
using HCP_UserVetting.Models;
using Microsoft.AspNetCore.Mvc;

namespace HCP_UserVetting.Controllers
{
    public class HomeController : Controller
    {
        private Data.HCP_DBContext _dbContext;

        private VettingModel _model;
        private User _user;

        private IList<Question> _questions = new List<Question>();
        private RulesEngine _rulesEngine;

        public HomeController(Data.HCP_DBContext dBContext)
        {
            _dbContext = dBContext;
            _rulesEngine = new RulesEngine(dBContext);
            /*
             * Note:
             *  Only pass model for User on inital load.
             *  Once user is submitted, load questions from database/in memory (like in the Comments() action method)
             */

            _user = new User();
            _questions = new List<Question>();

            _model = new VettingModel()
            {
                Questions = _questions,
                User = _user
            };
        }

        public ActionResult Index()
        {
            return View(_model);
        }


        [Route("Questions")]
        [ResponseCache(Location = ResponseCacheLocation.None, NoStore = true)]
        public ActionResult Questions()
        {
            PopulateQuestionsModel();
            return Json(_questions);
        }

        [Route("User/VetUser")]
        [HttpPost]
        public ActionResult VetUser(VettingModel model)
        {
            return View();
        }

        [Route("User/CheckUser")]
        [HttpPost]
        public ActionResult CheckUser(User user)
        {
            User existingUser = _dbContext.Users.FirstOrDefault(p => p.FirstName == user.FirstName && p.LastName == user.LastName && p.EmailAddress == user.EmailAddress);

            if (existingUser == null)
            {
                _dbContext.Users.Add(user);
                _dbContext.SaveChanges();
                return Content("PROCEED");
            }
            else if (existingUser.Vetted == false)
            {
                return Content("PROCEED");
            }
            else if (existingUser.Passed == true)
            {
                return Content("User has already passed the vetting process.");
            }
            else
            {
                return Content("User has been vetted and did not pass.");
            }
        }

        private void PopulateQuestionsModel()
        {
            Question questionOneA = new Question()
            {
                QuestionId = 0,
                QuestionNumber = 1,
                SubQuestionNumber = 1,
                QuestionText = "",
                FreeForm = false,
                IsActive = true
            };
            AnswerOption optionOne = new AnswerOption()
            {
                OptionId = 0,
                OptionType = "YESNO",
                OptionValue = "YES"
            };
            AnswerOption optionTwo = new AnswerOption()
            {
                OptionId = 1,
                OptionType = "YESNO",
                OptionValue = "NO"
            };
            questionOneA.Options.Add(optionOne);
            questionOneA.Options.Add(optionTwo);
            _questions.Add(questionOneA);

            var activeQuestions = _dbContext.Questions.Where(p => p.IsActive == true).OrderBy(p => p.QuestionNumber);
            foreach (var question in activeQuestions)
            {
                if (question.FreeForm == false)
                {
                    var options = (from ao in _dbContext.AnswerOptions
                                   join mqo in _dbContext.QuestionOptions on ao.OptionId equals mqo.OptionId
                                   where mqo.QuestionId == question.QuestionId
                                   select ao).ToList();
                    question.Options = options;
                }
            }
        }
    }
}