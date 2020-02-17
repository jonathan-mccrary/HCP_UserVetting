using System;
using System.Collections.Generic;
using System.Linq;
using HCP_UserVetting.Data.Models;
using HCP_UserVetting.Logic;
using HCP_UserVetting.Models;
using Microsoft.AspNetCore.Mvc;
using System.Json;

namespace HCP_UserVetting.Controllers
{
    public class HomeController : Controller
    {
        private Data.HCP_DBContext _dbContext;

        private User _user;
        private List<QuestionModel> _questions = new List<QuestionModel>();
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

            _questions = new List<QuestionModel>();

            _user = new User();
        }

        public ActionResult Index()
        {
            return View(_user);
        }


        [Route("Questions")]
        public ActionResult Questions()
        {
            PopulateQuestionsModel();
            return Json(_questions);
        }

        [Route("User/SubmitUser")]
        [HttpPost]
        public ActionResult SubmitUser(List<QuestionModel> vetting)
        {
            //Save results
            string test = string.Empty;
            var test2 = vetting;

            //run Rule Engine


            //Share results


            return Content(test);
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
                return Content("Proceed: User does not exist and has not been vetted yet.");
            }
            else if (existingUser.Vetted == false)
            {
                return Content("Proceed: User exitsts, but has not been vetted yet.");
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
            try
            {
                _questions = _dbContext.Questions.Where(p => p.IsActive == true)?.Select(p => new QuestionModel()
                {
                    Answer = string.Empty,
                    FreeForm = p.FreeForm,
                    IsActive = p.IsActive,
                    ParentAnswerValue = p.ParentAnswerValue,
                    ParentQuestionId = p.ParentQuestionId,
                    QuestionId = p.QuestionId,
                    QuestionNumber = p.QuestionNumber,
                    QuestionText = p.QuestionText,
                    SubQuestionNumber = p.SubQuestionNumber
                })?.ToList();
                foreach (var question in _questions)
                {
                    if (question.FreeForm == false)
                    {
                        question.Options = (from ao in _dbContext.AnswerOptions
                                            join mqo in _dbContext.QuestionOptions on ao.OptionId equals mqo.OptionId
                                            where mqo.QuestionId == question.QuestionId
                                            select ao).ToList();
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}