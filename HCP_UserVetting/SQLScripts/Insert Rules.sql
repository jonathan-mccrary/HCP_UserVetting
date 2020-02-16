USE HCP_DB
GO

--1
--If the provider is not on the committee and a committee exists, they should fail.
IF NOT EXISTS (SELECT * FROM [dbo].[Rules] WHERE [RuleDescription] = 'If the provider is not on the committee and a committee exists, they should fail.')
BEGIN
    INSERT INTO [dbo].[Rules](
	    [RuleDescription],
	    [IsActive])
    VALUES 
    (
        'If the provider is not on the committee and a committee exists, they should fail.',
        1
    )
END
GO

--2
--If they answer no to question 2, they should fail.
IF NOT EXISTS (SELECT * FROM [dbo].[Rules] WHERE [RuleDescription] = 'If they answer no to question 2, they should fail.')
BEGIN
    INSERT INTO [dbo].[Rules](
	    [RuleDescription],
	    [IsActive])
    VALUES 
    (
        'If they answer no to question 2, they should fail.',
        1
    )
END
GO

--3
--If they answer no to question 3, they should fail.
IF NOT EXISTS (SELECT * FROM [dbo].[Rules] WHERE [RuleDescription] = 'If they answer no to question 3, they should fail.')
BEGIN
    INSERT INTO [dbo].[Rules](
	    [RuleDescription],
	    [IsActive])
    VALUES 
    (
        'If they answer no to question 3, they should fail.',
        1
    )
END
GO

--4
--If they answer less than 10% to question 3, and they are not a decision maker (Question 2) they should fail.
IF NOT EXISTS (SELECT * FROM [dbo].[Rules] WHERE [RuleDescription] = 'If they answer less than 10% to question 3, and they are not a decision maker (Question 2) they should fail.')
BEGIN
    INSERT INTO [dbo].[Rules](
	    [RuleDescription],
	    [IsActive])
    VALUES 
    (
        'If they answer less than 10% to question 3, and they are not a decision maker (Question 2) they should fail.',
        1
    )
END
GO

--5
--If they are an influencer and there is no committee (Question 1) they should fail.
IF NOT EXISTS (SELECT * FROM [dbo].[Rules] WHERE [RuleDescription] = 'If they are an influencer and there is no committee (Question 1) they should fail.')
BEGIN
    INSERT INTO [dbo].[Rules](
	    [RuleDescription],
	    [IsActive])
    VALUES 
    (
        'If they are an influencer and there is no committee (Question 1) they should fail.',
        1
    )
END
GO