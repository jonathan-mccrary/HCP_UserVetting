using HCP_UserVetting.Data.Models;
using System.Collections.Generic;

namespace HCP_UserVetting.Models
{
    public class VettingModel
    {
        public User User { get; set; }
        public IList<Question> Questions { get; set; }
    }
}