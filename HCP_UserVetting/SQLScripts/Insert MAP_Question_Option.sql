
USE HCP_DB
GO

--Question 1A - YES
IF NOT EXISTS (SELECT * FROM [dbo].[MAP_Question_Option] 
    WHERE [QuestionId] = (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 1 AND SubQuestionNumber = 1) 
        AND [OptionId] = (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'YES'))
BEGIN
    INSERT INTO [dbo].[MAP_Question_Option]
    (
	    [QuestionId],
        [OptionId]
    )
    VALUES 
    (
        (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 1 AND SubQuestionNumber = 1),
        (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'YES')
    )
END
GO

--Question 1A - NO
IF NOT EXISTS (SELECT * FROM [dbo].[MAP_Question_Option] 
    WHERE [QuestionId] = (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 1 AND SubQuestionNumber = 1) 
        AND [OptionId] = (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'NO'))
BEGIN
    INSERT INTO [dbo].[MAP_Question_Option]
    (
	    [QuestionId],
        [OptionId]
    )
    VALUES 
    (
        (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 1 AND SubQuestionNumber = 1),
        (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'NO')
    )
END
GO

--Question 1B - YES
IF NOT EXISTS (SELECT * FROM [dbo].[MAP_Question_Option] 
    WHERE [QuestionId] = (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 1 AND SubQuestionNumber = 2) 
        AND [OptionId] = (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'YES'))
BEGIN
    INSERT INTO [dbo].[MAP_Question_Option]
    (
	    [QuestionId],
        [OptionId]
    )
    VALUES 
    (
        (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 1 AND SubQuestionNumber = 2),
        (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'YES')
    )
END
GO

--Question 1B - NO
IF NOT EXISTS (SELECT * FROM [dbo].[MAP_Question_Option] 
    WHERE [QuestionId] = (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 1 AND SubQuestionNumber = 2) 
        AND [OptionId] = (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'NO'))
BEGIN
    INSERT INTO [dbo].[MAP_Question_Option]
    (
	    [QuestionId],
        [OptionId]
    )
    VALUES 
    (
        (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 1 AND SubQuestionNumber = 2),
        (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'NO')
    )
END
GO

--Question 1A - NO
IF NOT EXISTS (SELECT * FROM [dbo].[MAP_Question_Option] 
    WHERE [QuestionId] = (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 1 AND SubQuestionNumber = 1) 
        AND [OptionId] = (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'NO'))
BEGIN
    INSERT INTO [dbo].[MAP_Question_Option]
    (
	    [QuestionId],
        [OptionId]
    )
    VALUES 
    (
        (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 1 AND SubQuestionNumber = 1),
        (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'NO')
    )
END
GO

--Question 1C - YES
IF NOT EXISTS (SELECT * FROM [dbo].[MAP_Question_Option] 
    WHERE [QuestionId] = (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 1 AND SubQuestionNumber = 3) 
        AND [OptionId] = (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'YES'))
BEGIN
    INSERT INTO [dbo].[MAP_Question_Option]
    (
	    [QuestionId],
        [OptionId]
    )
    VALUES 
    (
        (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 1 AND SubQuestionNumber = 3),
        (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'YES')
    )
END
GO

--Question 1C - NO
IF NOT EXISTS (SELECT * FROM [dbo].[MAP_Question_Option] 
    WHERE [QuestionId] = (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 1 AND SubQuestionNumber = 3) 
        AND [OptionId] = (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'NO'))
BEGIN
    INSERT INTO [dbo].[MAP_Question_Option]
    (
	    [QuestionId],
        [OptionId]
    )
    VALUES 
    (
        (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 1 AND SubQuestionNumber = 3),
        (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'NO')
    )
END
GO



--Question 2A - YES
IF NOT EXISTS (SELECT * FROM [dbo].[MAP_Question_Option] 
    WHERE [QuestionId] = (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 2 AND SubQuestionNumber = 1) 
        AND [OptionId] = (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'YES'))
BEGIN
    INSERT INTO [dbo].[MAP_Question_Option]
    (
	    [QuestionId],
        [OptionId]
    )
    VALUES 
    (
        (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 2 AND SubQuestionNumber = 1),
        (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'YES')
    )
END
GO

--Question 2A - NO
IF NOT EXISTS (SELECT * FROM [dbo].[MAP_Question_Option] 
    WHERE [QuestionId] = (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 2 AND SubQuestionNumber = 1) 
        AND [OptionId] = (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'NO'))
BEGIN
    INSERT INTO [dbo].[MAP_Question_Option]
    (
	    [QuestionId],
        [OptionId]
    )
    VALUES 
    (
        (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 2 AND SubQuestionNumber = 1),
        (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'NO')
    )
END
GO

--Question 2B - YES
IF NOT EXISTS (SELECT * FROM [dbo].[MAP_Question_Option] 
    WHERE [QuestionId] = (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 2 AND SubQuestionNumber = 2) 
        AND [OptionId] = (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'YES'))
BEGIN
    INSERT INTO [dbo].[MAP_Question_Option]
    (
	    [QuestionId],
        [OptionId]
    )
    VALUES 
    (
        (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 2 AND SubQuestionNumber = 2),
        (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'YES')
    )
END
GO

--Question 2B - NO
IF NOT EXISTS (SELECT * FROM [dbo].[MAP_Question_Option] 
    WHERE [QuestionId] = (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 2 AND SubQuestionNumber = 2) 
        AND [OptionId] = (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'NO'))
BEGIN
    INSERT INTO [dbo].[MAP_Question_Option]
    (
	    [QuestionId],
        [OptionId]
    )
    VALUES 
    (
        (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 2 AND SubQuestionNumber = 2),
        (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'NO')
    )
END
GO

--Question 2D - My Facility
IF NOT EXISTS (SELECT * FROM [dbo].[MAP_Question_Option] 
    WHERE [QuestionId] = (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 2 AND SubQuestionNumber = 4) 
        AND [OptionId] = (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'My Facility'))
BEGIN
    INSERT INTO [dbo].[MAP_Question_Option]
    (
	    [QuestionId],
        [OptionId]
    )
    VALUES 
    (
        (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 2 AND SubQuestionNumber = 4),
        (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'My Facility')
    )
END
GO

--Question 2D - Multiple Facilities
IF NOT EXISTS (SELECT * FROM [dbo].[MAP_Question_Option] 
    WHERE [QuestionId] = (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 2 AND SubQuestionNumber = 4) 
        AND [OptionId] = (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'Multiple Facilities'))
BEGIN
    INSERT INTO [dbo].[MAP_Question_Option]
    (
	    [QuestionId],
        [OptionId]
    )
    VALUES 
    (
        (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 2 AND SubQuestionNumber = 4),
        (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'Multiple Facilities')
    )
END
GO

--Question 2E - My Facility
IF NOT EXISTS (SELECT * FROM [dbo].[MAP_Question_Option] 
    WHERE [QuestionId] = (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 2 AND SubQuestionNumber = 5) 
        AND [OptionId] = (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'Regional'))
BEGIN
    INSERT INTO [dbo].[MAP_Question_Option]
    (
	    [QuestionId],
        [OptionId]
    )
    VALUES 
    (
        (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 2 AND SubQuestionNumber = 5),
        (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'Regional')
    )
END
GO

--Question 2E - Multiple Facilities
IF NOT EXISTS (SELECT * FROM [dbo].[MAP_Question_Option] 
    WHERE [QuestionId] = (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 2 AND SubQuestionNumber = 5) 
        AND [OptionId] = (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'National'))
BEGIN
    INSERT INTO [dbo].[MAP_Question_Option]
    (
	    [QuestionId],
        [OptionId]
    )
    VALUES 
    (
        (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 2 AND SubQuestionNumber = 5),
        (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'National')
    )
END
GO


--Question 3A - YES
IF NOT EXISTS (SELECT * FROM [dbo].[MAP_Question_Option] 
    WHERE [QuestionId] = (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 3 AND SubQuestionNumber = 1) 
        AND [OptionId] = (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'YES'))
BEGIN
    INSERT INTO [dbo].[MAP_Question_Option]
    (
	    [QuestionId],
        [OptionId]
    )
    VALUES 
    (
        (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 3 AND SubQuestionNumber = 1),
        (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'YES')
    )
END
GO

--Question 3A - NO
IF NOT EXISTS (SELECT * FROM [dbo].[MAP_Question_Option] 
    WHERE [QuestionId] = (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 3 AND SubQuestionNumber = 1) 
        AND [OptionId] = (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'NO'))
BEGIN
    INSERT INTO [dbo].[MAP_Question_Option]
    (
	    [QuestionId],
        [OptionId]
    )
    VALUES 
    (
        (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 3 AND SubQuestionNumber = 1),
        (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'NO')
    )
END
GO

--Question 3B - Less than 10%
IF NOT EXISTS (SELECT * FROM [dbo].[MAP_Question_Option] 
    WHERE [QuestionId] = (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 3 AND SubQuestionNumber = 2) 
        AND [OptionId] = (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'Less than 10%'))
BEGIN
    INSERT INTO [dbo].[MAP_Question_Option]
    (
	    [QuestionId],
        [OptionId]
    )
    VALUES 
    (
        (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 3 AND SubQuestionNumber = 2),
        (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'Less than 10%')
    )
END
GO

--Question 3B - 10 - 20%
IF NOT EXISTS (SELECT * FROM [dbo].[MAP_Question_Option] 
    WHERE [QuestionId] = (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 3 AND SubQuestionNumber = 2) 
        AND [OptionId] = (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = '10 - 20%'))
BEGIN
    INSERT INTO [dbo].[MAP_Question_Option]
    (
	    [QuestionId],
        [OptionId]
    )
    VALUES 
    (
        (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 3 AND SubQuestionNumber = 2),
        (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = '10 - 20%')
    )
END
GO

--Question 3B - 20 – 40%
IF NOT EXISTS (SELECT * FROM [dbo].[MAP_Question_Option] 
    WHERE [QuestionId] = (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 3 AND SubQuestionNumber = 2) 
        AND [OptionId] = (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = '20 – 40%'))
BEGIN
    INSERT INTO [dbo].[MAP_Question_Option]
    (
	    [QuestionId],
        [OptionId]
    )
    VALUES 
    (
        (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 3 AND SubQuestionNumber = 2),
        (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = '20 – 40%')
    )
END
GO

--Question 3B - Over 40%
IF NOT EXISTS (SELECT * FROM [dbo].[MAP_Question_Option] 
    WHERE [QuestionId] = (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 3 AND SubQuestionNumber = 2) 
        AND [OptionId] = (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'Over 40%'))
BEGIN
    INSERT INTO [dbo].[MAP_Question_Option]
    (
	    [QuestionId],
        [OptionId]
    )
    VALUES 
    (
        (SELECT QuestionId FROM [dbo].[Questions] WHERE QuestionNumber = 3 AND SubQuestionNumber = 2),
        (SELECT OptionId FROM [dbo].[AnswerOptions] WHERE OptionValue = 'Over 40%')
    )
END
GO