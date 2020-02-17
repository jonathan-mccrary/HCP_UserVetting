using System;
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

        private User _user;
        private List<QuestionModel> _questions = new List<QuestionModel>();
        private RulesEngine _rulesEngine;

        public HomeController(Data.HCP_DBContext dBContext)
        {
            _dbContext = dBContext;
            _rulesEngine = new RulesEngine(dBContext);
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

        [Route("Questions/SubmitQuestions")]
        [HttpPost]
        public ActionResult SubmitQuestions(VettingModel model)
        {
            try
            {
                /**/
                if (model != null && model.Questions != null)
                {
                    User existingUser = _dbContext.Users.FirstOrDefault(p => p.FirstName == model.User.FirstName && p.LastName == model.User.LastName && p.EmailAddress == model.User.EmailAddress);
                    //Save results
                    foreach (var result in model.Questions)
                    {
                        if (!string.IsNullOrEmpty(result.Answer))
                        {
                            MAP_User_Question_Response response = new MAP_User_Question_Response()
                            {
                                QuestionId = result.QuestionId,
                                Response = result.Answer,
                                UserId = existingUser.UserId
                            };
                            _dbContext.QuestionResponses.Add(response);
                            _dbContext.SaveChanges();
                        }
                    }

                    //run Rule Engine
                    var pass = _rulesEngine.RunRulesEngineOnUser(existingUser.UserId);

                    //Share results
                    if (pass)
                    {
                        return Content("Provider passed vetting process.");
                    }
                    else
                    {
                        return Content("Provider failed vetting process.");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                throw;//debugging purposes
            }
            return Content("No results because something went wrong.");
        }

        [Route("User/CheckUser")]
        [HttpPost]
        public ActionResult CheckUser(User user)
        {
            try
            {
                _user = user;
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
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return Content(ex.Message);
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
                Console.WriteLine(ex.Message);
                throw;
            }
        }
    }
}