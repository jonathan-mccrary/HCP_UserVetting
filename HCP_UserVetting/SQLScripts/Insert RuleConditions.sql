USE HCP_DB
GO

--Rule: If the provider is not on the committee and a committee exists, they should fail.
--Condition: Committee exists
IF NOT EXISTS (SELECT * FROM [dbo].[RuleConditions] 
    WHERE [RuleId] = (SELECT [RuleId] FROM [dbo].[Rules] WHERE [RuleDescription] = 'If the provider is not on the committee and a committee exists, they should fail.')
        AND [QuestionId] = (SELECT [QuestionId] FROM [dbo].[Questions] WHERE [QuestionNumber] = 1 and [SubQuestionNumber] = 1))
BEGIN
    INSERT INTO [dbo].[RuleConditions]
    (
        [RuleId],
        [QuestionId],
        [ExpectedResult],
        [IsActive]
    )
    VALUES 
    (
        (SELECT [RuleId] FROM [dbo].[Rules] WHERE [RuleDescription] = 'If the provider is not on the committee and a committee exists, they should fail.'),
        (SELECT [QuestionId] FROM [dbo].[Questions] WHERE [QuestionNumber] = 1 and [SubQuestionNumber] = 1),
        'YES',
        1
    )
END
GO

--Rule: If the provider is not on the committee and a committee exists, they should fail.
--Condition: Provider is not on committee
IF NOT EXISTS (SELECT * FROM [dbo].[RuleConditions] 
    WHERE [RuleId] = (SELECT [RuleId] FROM [dbo].[Rules] WHERE [RuleDescription] = 'If the provider is not on the committee and a committee exists, they should fail.')
        AND [QuestionId] = (SELECT [QuestionId] FROM [dbo].[Questions] WHERE [QuestionNumber] = 1 and [SubQuestionNumber] = 2))
BEGIN
    INSERT INTO [dbo].[RuleConditions]
    (
        [RuleId],
        [QuestionId],
        [ExpectedResult],
        [IsActive]
    )
    VALUES 
    (
        (SELECT [RuleId] FROM [dbo].[Rules] WHERE [RuleDescription] = 'If the provider is not on the committee and a committee exists, they should fail.'),
        (SELECT [QuestionId] FROM [dbo].[Questions] WHERE [QuestionNumber] = 1 and [SubQuestionNumber] = 2),
        'NO',
        1
    )
END
GO

--Rule: If they answer no to question 2, they should fail. 
--Condition: they answer no to question 2,
IF NOT EXISTS (SELECT * FROM [dbo].[RuleConditions] 
    WHERE [RuleId] = (SELECT [RuleId] FROM [dbo].[Rules] WHERE [RuleDescription] = 'If they answer no to question 2, they should fail.')
        AND [QuestionId] = (SELECT [QuestionId] FROM [dbo].[Questions] WHERE [QuestionNumber] = 2 and [SubQuestionNumber] = 1))
BEGIN
    INSERT INTO [dbo].[RuleConditions]
    (
        [RuleId],
        [QuestionId],
        [ExpectedResult],
        [IsActive]
    )
    VALUES 
    (
        (SELECT [RuleId] FROM [dbo].[Rules] WHERE [RuleDescription] = 'If they answer no to question 2, they should fail.'),
        (SELECT [QuestionId] FROM [dbo].[Questions] WHERE [QuestionNumber] = 2 and [SubQuestionNumber] = 1),
        'NO',
        1
    )
END
GO

--Rule: If they answer no to question 3, they should fail.
--Condition: Must answer YES to Question 3A
IF NOT EXISTS (SELECT * FROM [dbo].[RuleConditions] 
    WHERE [RuleId] = (SELECT [RuleId] FROM [dbo].[Rules] WHERE [RuleDescription] = 'If they answer no to question 3, they should fail.')
        AND [QuestionId] = (SELECT [QuestionId] FROM [dbo].[Questions] WHERE [QuestionNumber] = 3 and [SubQuestionNumber] = 1))
BEGIN
    INSERT INTO [dbo].[RuleConditions]
    (
        [RuleId],
        [QuestionId],
        [ExpectedResult],
        [IsActive]
    )
    VALUES 
    (
        (SELECT [RuleId] FROM [dbo].[Rules] WHERE [RuleDescription] = 'If they answer no to question 3, they should fail.'),
        (SELECT [QuestionId] FROM [dbo].[Questions] WHERE [QuestionNumber] = 3 and [SubQuestionNumber] = 1),
        'NO',
        1
    )
END
GO


--Rule: If they answer less than 10% to question 3, and they are not a decision maker (Question 2) they should fail.
--Condition: Must answer YES to Question 3A
IF NOT EXISTS (SELECT * FROM [dbo].[RuleConditions] 
    WHERE [RuleId] = (SELECT [RuleId] FROM [dbo].[Rules] WHERE [RuleDescription] = 'If they answer less than 10% to question 3, and they are not a decision maker (Question 2) they should fail.')
        AND [QuestionId] = (SELECT [QuestionId] FROM [dbo].[Questions] WHERE [QuestionNumber] = 3 and [SubQuestionNumber] = 1))
BEGIN
    INSERT INTO [dbo].[RuleConditions]
    (
        [RuleId],
        [QuestionId],
        [ExpectedResult],
        [IsActive]
    )
    VALUES 
    (
        (SELECT [RuleId] FROM [dbo].[Rules] WHERE [RuleDescription] = 'If they answer less than 10% to question 3, and they are not a decision maker (Question 2) they should fail.'),
        (SELECT [QuestionId] FROM [dbo].[Questions] WHERE [QuestionNumber] = 3 and [SubQuestionNumber] = 1),
        'YES',
        1
    )
END
GO

--Rule: If they answer less than 10% to question 3, and they are not a decision maker (Question 2) they should fail.
--Condition: They answer less than 10% to Question 3B
IF NOT EXISTS (SELECT * FROM [dbo].[RuleConditions] 
    WHERE [RuleId] = (SELECT [RuleId] FROM [dbo].[Rules] WHERE [RuleDescription] = 'If they answer less than 10% to question 3, and they are not a decision maker (Question 2) they should fail.')
        AND [QuestionId] = (SELECT [QuestionId] FROM [dbo].[Questions] WHERE [QuestionNumber] = 3 and [SubQuestionNumber] = 2))
BEGIN
    INSERT INTO [dbo].[RuleConditions]
    (
        [RuleId],
        [QuestionId],
        [ExpectedResult],
        [IsActive]
    )
    VALUES 
    (
        (SELECT [RuleId] FROM [dbo].[Rules] WHERE [RuleDescription] = 'If they answer less than 10% to question 3, and they are not a decision maker (Question 2) they should fail.'),
        (SELECT [QuestionId] FROM [dbo].[Questions] WHERE [QuestionNumber] = 3 and [SubQuestionNumber] = 2),
        'Less than 10%',
        1
    )
END
GO

--Rule: If they answer less than 10% to question 3, and they are not a decision maker (Question 2) they should fail.
--Condition: Answered Yes to Question 2A
IF NOT EXISTS (SELECT * FROM [dbo].[RuleConditions] 
    WHERE [RuleId] = (SELECT [RuleId] FROM [dbo].[Rules] WHERE [RuleDescription] = 'If they answer less than 10% to question 3, and they are not a decision maker (Question 2) they should fail.')
        AND [QuestionId] = (SELECT [QuestionId] FROM [dbo].[Questions] WHERE [QuestionNumber] = 2 and [SubQuestionNumber] = 1))
BEGIN
    INSERT INTO [dbo].[RuleConditions]
    (
        [RuleId],
        [QuestionId],
        [ExpectedResult],
        [IsActive]
    )
    VALUES 
    (
        (SELECT [RuleId] FROM [dbo].[Rules] WHERE [RuleDescription] = 'If they answer less than 10% to question 3, and they are not a decision maker (Question 2) they should fail.'),
        (SELECT [QuestionId] FROM [dbo].[Questions] WHERE [QuestionNumber] = 2 and [SubQuestionNumber] = 1),
        'YES',
        1
    )
END
GO


--Rule: If they answer less than 10% to question 3, and they are not a decision maker (Question 2) they should fail.
--Condition: They are not a decision maker (Question 2C)
IF NOT EXISTS (SELECT * FROM [dbo].[RuleConditions] 
    WHERE [RuleId] = (SELECT [RuleId] FROM [dbo].[Rules] WHERE [RuleDescription] = 'If they answer less than 10% to question 3, and they are not a decision maker (Question 2) they should fail.')
        AND [QuestionId] = (SELECT [QuestionId] FROM [dbo].[Questions] WHERE [QuestionNumber] = 2 and [SubQuestionNumber] = 3))
BEGIN
    INSERT INTO [dbo].[RuleConditions]
    (
        [RuleId],
        [QuestionId],
        [ExpectedResult],
        [IsActive]
    )
    VALUES 
    (
        (SELECT [RuleId] FROM [dbo].[Rules] WHERE [RuleDescription] = 'If they answer less than 10% to question 3, and they are not a decision maker (Question 2) they should fail.'),
        (SELECT [QuestionId] FROM [dbo].[Questions] WHERE [QuestionNumber] = 2 and [SubQuestionNumber] = 3),
        'NO',
        1
    )
END
GO


--Rule: If they are an influencer and there is no committee (Question 1) they should fail.
--Condition: They are an influencer (Question 2B)
IF NOT EXISTS (SELECT * FROM [dbo].[RuleConditions] 
    WHERE [RuleId] = (SELECT [RuleId] FROM [dbo].[Rules] WHERE [RuleDescription] = 'If they are an influencer and there is no committee (Question 1) they should fail.')
        AND [QuestionId] = (SELECT [QuestionId] FROM [dbo].[Questions] WHERE [QuestionNumber] = 2 and [SubQuestionNumber] = 2))
BEGIN
    INSERT INTO [dbo].[RuleConditions]
    (
        [RuleId],
        [QuestionId],
        [ExpectedResult],
        [IsActive]
    )
    VALUES 
    (
        (SELECT [RuleId] FROM [dbo].[Rules] WHERE [RuleDescription] = 'If they are an influencer and there is no committee (Question 1) they should fail.'),
        (SELECT [QuestionId] FROM [dbo].[Questions] WHERE [QuestionNumber] = 2 and [SubQuestionNumber] = 2),
        'YES',
        1
    )
END
GO

--Rule: If they are an influencer and there is no committee (Question 1) they should fail.
--Condition: There is no committee (Question 1A)
IF NOT EXISTS (SELECT * FROM [dbo].[RuleConditions] 
    WHERE [RuleId] = (SELECT [RuleId] FROM [dbo].[Rules] WHERE [RuleDescription] = 'If they are an influencer and there is no committee (Question 1) they should fail.')
        AND [QuestionId] = (SELECT [QuestionId] FROM [dbo].[Questions] WHERE [QuestionNumber] = 1 and [SubQuestionNumber] = 1))
BEGIN
    INSERT INTO [dbo].[RuleConditions]
    (
        [RuleId],
        [QuestionId],
        [ExpectedResult],
        [IsActive]
    )
    VALUES 
    (
        (SELECT [RuleId] FROM [dbo].[Rules] WHERE [RuleDescription] = 'If they are an influencer and there is no committee (Question 1) they should fail.'),
        (SELECT [QuestionId] FROM [dbo].[Questions] WHERE [QuestionNumber] = 1 and [SubQuestionNumber] = 1),
        'NO',
        1
    )
END
GO