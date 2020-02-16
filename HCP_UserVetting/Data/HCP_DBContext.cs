using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using HCP_UserVetting.Data.Models;
using Microsoft.EntityFrameworkCore;

namespace HCP_UserVetting.Data
{
    public class HCP_DBContext : DbContext
    {

        public HCP_DBContext(DbContextOptions<HCP_DBContext> options) : base(options)
        {
        }


        public DbSet<AnswerOption> AnswerOptions { get; set; }
        public DbSet<Question> Questions { get; set; }
        public DbSet<Rule> Rules { get; set; }
        public DbSet<RuleCondition> RuleConditions { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<MAP_Question_Option> QuestionOptions { get; set; }
        public DbSet<MAP_User_Question_Response> QuestionResponses { get; set; }
        //public DbSet<MAP_WebUser_Question> UserQuestions { get; set; }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AnswerOption>().ToTable("AnswerOptions");
            modelBuilder.Entity<Question>().ToTable("Questions");
            modelBuilder.Entity<Rule>().ToTable("Rules");
            modelBuilder.Entity<RuleCondition>().ToTable("RuleConditions");
            modelBuilder.Entity<User>().ToTable("Users");
            modelBuilder.Entity<MAP_Question_Option>().ToTable("MAP_Question_Option");
            modelBuilder.Entity<MAP_User_Question_Response>().ToTable("MAP_User_Question_Response");
        }
    }
}
