Use HCP_DB
Go

IF (NOT EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'Users'))
BEGIN
    create table Users(
    UserId bigint IDENTITY(1,1) primary key,
    FirstName varchar(20) not null,
    LastName varchar(20) not null,
    EmailAddress varchar(50) not null,
    Vetted bit default 0,
    Passed bit default 0
    );
END
go

IF (NOT EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'Questions'))
BEGIN
    create table Questions(
        QuestionId bigint IDENTITY(1,1) primary KEY,
        QuestionText varchar(1000) not null,
        QuestionNumber int not null,
        SubQuestionNumber int not null,
        FreeForm bit default 0 not null,
        ParentQuestionId bigint null,
        ParentAnswerValue VARCHAR(100) null,
        IsActive bit default 1 not null,
        CONSTRAINT fk_Question_ParentQuestion FOREIGN Key (ParentQuestionId) REFERENCES Questions(QuestionId),
    );
END
go

IF (NOT EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'AnswerOptions'))
BEGIN
    create table AnswerOptions (
        OptionId bigint IDENTITY(1,1) primary key,
        OptionValue varchar(100) not NULL,
        OptionType varchar(20) not null
    );
END
go

IF (NOT EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'MAP_Question_Option'))
BEGIN
    create table MAP_Question_Option (
        QuestionOptionId bigint IDENTITY(1,1) primary KEY,
        QuestionId bigint not null,
        OptionId bigint not NULL,
        CONSTRAINT fk_Question_QuestionOption FOREIGN Key (QuestionId) REFERENCES Questions(QuestionId),
        CONSTRAINT fk_Option_QuestionOption FOREIGN Key (OptionId) REFERENCES AnswerOptions(OptionId)
    );
END
go

IF (NOT EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'Rules'))
BEGIN
    create table Rules(
        RuleId bigint IDENTITY(1,1) primary KEY,
        RuleDescription varchar(1000) not NULL,
        IsActive bit not null default 1
    );
END
go

IF (NOT EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'RuleConditions'))
BEGIN
    create table RuleConditions(
        ConditionId bigint IDENTITY(1,1) primary key,
        RuleId bigint not null,
        QuestionId bigint not NULL,
        ExpectedResult varchar(200) not NULL,
        IsActive bit not null default 1,
        CONSTRAINT fk_Rule_Condtion FOREIGN Key (RuleId) REFERENCES Rules (RuleId)
    );
END
go

IF (NOT EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'RuleConditions'))
BEGIN
    create table MAP_User_Question_Response(
        QuestionResponseID bigint IDENTITY(1,1) primary key,
        UserId bigint not null,
        QuestionId bigint not null,
        Response varchar(100) not null,
        CONSTRAINT fk_User_QuestionResponse FOREIGN Key (UserId) REFERENCES Users(UserId),
        CONSTRAINT fk_Question_QuestionResponse FOREIGN Key (QuestionId) REFERENCES Questions(QuestionId)
    );
END
go

IF (NOT EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'MAP_User_Question_Response'))
BEGIN
    create table MAP_User_Question_Response(
        QuestionResponseID bigint IDENTITY(1,1) primary key,
        UserId bigint not null,
        QuestionId bigint not null,
        Response varchar(100) not null,
        CONSTRAINT fk_User_QuestionResponse FOREIGN Key (UserId) REFERENCES Users(UserId),
        CONSTRAINT fk_Question_QuestionResponse FOREIGN Key (QuestionId) REFERENCES Questions(QuestionId)
    );
END
go