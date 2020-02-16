USE HCP_DB
GO

--Question 1A
IF NOT EXISTS (SELECT * FROM [dbo].[Questions] WHERE [QuestionText] = 'Are your hospital/health system product or service decisions made by a Value Analysis Committee (or other committee)?')
BEGIN
    INSERT INTO [dbo].[Questions](
        [QuestionText],
        [QuestionNumber],
        [SubQuestionNumber],
        [FreeForm],
        [ParentQuestionId],
        [ParenteAnswerValue],
        [IsActive])
    VALUES 
    (
        'Are your hospital/health system product or service decisions made by a Value Analysis Committee (or other committee)?',
        1,
        1,
        0,
        NULL,
        NULL,
        1
    )
END
GO

--Question 1B
IF NOT EXISTS (SELECT * FROM [dbo].[Questions] WHERE [QuestionText] = 'Are you on the committee?')
BEGIN
    INSERT INTO [dbo].[Questions](
        [QuestionText],
        [QuestionNumber],
        [SubQuestionNumber],
        [FreeForm],
        [ParentQuestionId],
        [ParenteAnswerValue],
        [IsActive])
    VALUES 
    (
        'Are you on the committee?',
        1,
        2,
        0,
        (SELECT [QuestionId] FROM [dbo].[Questions] WHERE [QuestionNumber] = 1 AND [SubQuestionNumber] = 1),
        'YES',
        1
    )
END
GO

--Question 1C
IF NOT EXISTS (SELECT * FROM [dbo].[Questions] WHERE [QuestionText] = 'Are you a voting member?')
BEGIN
    INSERT INTO [dbo].[Questions](
        [QuestionText],
        [QuestionNumber],
        [SubQuestionNumber],
        [FreeForm],
        [ParentQuestionId],
        [ParenteAnswerValue],
        [IsActive])
    VALUES 
    (
        'Are you a voting member?',
        1,
        3,
        0,
        (SELECT [QuestionId] FROM [dbo].[Questions] WHERE [QuestionNumber] = 1 AND [SubQuestionNumber] = 2),
        'YES',
        1
    )
END
GO

--Question 2A
IF NOT EXISTS (SELECT * FROM [dbo].[Questions] WHERE [QuestionText] = 'Are you a decision maker on products or services used in your hospital/system?')
BEGIN
    INSERT INTO [dbo].[Questions](
        [QuestionText],
        [QuestionNumber],
        [SubQuestionNumber],
        [FreeForm],
        [ParentQuestionId],
        [ParenteAnswerValue],
        [IsActive])
    VALUES 
    (
        'Are you a decision maker on products or services used in your hospital/system?',
        2,
        1,
        0,
        NULL,
        NULL,
        1
    )
END
GO

--Question 2B
IF NOT EXISTS (SELECT * FROM [dbo].[Questions] WHERE [QuestionText] = 'Are you an influencer on products and services purchased for your hospital/system?')
BEGIN
    INSERT INTO [dbo].[Questions](
        [QuestionText],
        [QuestionNumber],
        [SubQuestionNumber],
        [FreeForm],
        [ParentQuestionId],
        [ParenteAnswerValue],
        [IsActive])
    VALUES 
    (
        'Are you an influencer on products and services purchased for your hospital/system?',
        2,
        2,
        0,
        (SELECT [QuestionId] FROM [dbo].[Questions] WHERE [QuestionNumber] = 2 AND [SubQuestionNumber] = 1),
        'NO',
        1
    )
END
GO

--Question 2C
IF NOT EXISTS (SELECT * FROM [dbo].[Questions] WHERE [QuestionText] = 'What is the name and title of the decision maker from your hospital/system?')
BEGIN
    INSERT INTO [dbo].[Questions](
        [QuestionText],
        [QuestionNumber],
        [SubQuestionNumber],
        [FreeForm],
        [ParentQuestionId],
        [ParenteAnswerValue],
        [IsActive])
    VALUES 
    (
        'What is the name and title of the decision maker from your hospital/system?',
        2,
        3,
        1,
        (SELECT [QuestionId] FROM [dbo].[Questions] WHERE [QuestionNumber] = 2 AND [SubQuestionNumber] = 2),
        'NO',
        1
    )
END
GO

--Question 2D
IF NOT EXISTS (SELECT * FROM [dbo].[Questions] WHERE [QuestionText] = 'Do you make decisions exclusively for the facility where you work daily, or are you responsible for more than one facility?')
BEGIN
    INSERT INTO [dbo].[Questions](
        [QuestionText],
        [QuestionNumber],
        [SubQuestionNumber],
        [FreeForm],
        [ParentQuestionId],
        [ParenteAnswerValue],
        [IsActive])
    VALUES 
    (
        'Do you make decisions exclusively for the facility where you work daily, or are you responsible for more than one facility?',
        2,
        4,
        0,
        (SELECT [QuestionId] FROM [dbo].[Questions] WHERE [QuestionNumber] = 2 AND [SubQuestionNumber] = 1),
        'YES',
        1
    )
END
GO

--Question 2E
IF NOT EXISTS (SELECT * FROM [dbo].[Questions] WHERE [QuestionText] = 'Do you make decisions for multiple facilities on a regional or national basis for your organization?')
BEGIN
    INSERT INTO [dbo].[Questions](
        [QuestionText],
        [QuestionNumber],
        [SubQuestionNumber],
        [FreeForm],
        [ParentQuestionId],
        [ParenteAnswerValue],
        [IsActive])
    VALUES 
    (
        'Do you make decisions for multiple facilities on a regional or national basis for your organization?',
        2,
        5,
        0,
        (SELECT [QuestionId] FROM [dbo].[Questions] WHERE [QuestionNumber] = 2 AND [SubQuestionNumber] = 4),
        'Multiple Facilities',
        1
    )
END
GO

--Question 2F
IF NOT EXISTS (SELECT * FROM [dbo].[Questions] WHERE [QuestionText] = 'How Many facilities are you currently responsible for?')
BEGIN
    INSERT INTO [dbo].[Questions](
        [QuestionText],
        [QuestionNumber],
        [SubQuestionNumber],
        [FreeForm],
        [ParentQuestionId],
        [ParenteAnswerValue],
        [IsActive])
    VALUES 
    (
        'How Many facilities are you currently responsible for?',
        2,
        6,
        1,
        (SELECT [QuestionId] FROM [dbo].[Questions] WHERE [QuestionNumber] = 2 AND [SubQuestionNumber] = 4),
        'Multiple Facilities',
        1
    )
END
GO

--Question 3A
IF NOT EXISTS (SELECT * FROM [dbo].[Questions] WHERE [QuestionText] = 'In your current role, do you regularly communicate and/or meet with vendors/suppliers?')
BEGIN
    INSERT INTO [dbo].[Questions](
        [QuestionText],
        [QuestionNumber],
        [SubQuestionNumber],
        [FreeForm],
        [ParentQuestionId],
        [ParenteAnswerValue],
        [IsActive])
    VALUES 
    (
        'In your current role, do you regularly communicate and/or meet with vendors/suppliers?',
        3,
        1,
        0,
        NULL,
        NULL,
        1
    )
END
GO

--Question 3B
IF NOT EXISTS (SELECT * FROM [dbo].[Questions] WHERE [QuestionText] = 'In an average week, how much of your time is spent communicating with vendors/suppliers?')
BEGIN
    INSERT INTO [dbo].[Questions](
        [QuestionText],
        [QuestionNumber],
        [SubQuestionNumber],
        [FreeForm],
        [ParentQuestionId],
        [ParenteAnswerValue],
        [IsActive])
    VALUES 
    (
        'In an average week, how much of your time is spent communicating with vendors/suppliers?',
        3,
        2,
        0,
        (SELECT [QuestionId] FROM [dbo].[Questions] WHERE [QuestionNumber] = 3 AND [SubQuestionNumber] = 1),
        'YES',
        1
    )
END
GO