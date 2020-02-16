USE HCP_DB
GO

--YES
IF NOT EXISTS (SELECT * FROM [dbo].[AnswerOptions] WHERE [OptionValue] = 'YES' AND [OptionType] = 'DROPDOWN')
BEGIN
    INSERT INTO [dbo].[AnswerOptions](
	    [OptionValue],
	    [OptionType])
    VALUES 
    (
        'YES',
        'DROPDOWN'
    )
END
GO

--NO
IF NOT EXISTS (SELECT * FROM [dbo].[AnswerOptions] WHERE [OptionValue] = 'NO' AND [OptionType] = 'DROPDOWN')
BEGIN
    INSERT INTO [dbo].[AnswerOptions](
	    [OptionValue],
	    [OptionType])
    VALUES 
    (
        'NO',
        'DROPDOWN'
    )
END
GO

--My Facility
IF NOT EXISTS (SELECT * FROM [dbo].[AnswerOptions] WHERE [OptionValue] = 'My Facility' AND [OptionType] = 'DROPDOWN')
BEGIN
    INSERT INTO [dbo].[AnswerOptions](
	    [OptionValue],
	    [OptionType])
    VALUES 
    (
        'My Facility',
        'DROPDOWN'
    )
END
GO

--Multiple Facilities
IF NOT EXISTS (SELECT * FROM [dbo].[AnswerOptions] WHERE [OptionValue] = 'Multiple Facilities' AND [OptionType] = 'DROPDOWN')
BEGIN
    INSERT INTO [dbo].[AnswerOptions](
	    [OptionValue],
	    [OptionType])
    VALUES 
    (
        'Multiple Facilities',
        'DROPDOWN'
    )
END
GO

--Regional
IF NOT EXISTS (SELECT * FROM [dbo].[AnswerOptions] WHERE [OptionValue] = 'Regional' AND [OptionType] = 'DROPDOWN')
BEGIN
    INSERT INTO [dbo].[AnswerOptions](
	    [OptionValue],
	    [OptionType])
    VALUES 
    (
        'Regional',
        'DROPDOWN'
    )
END
GO

--National
IF NOT EXISTS (SELECT * FROM [dbo].[AnswerOptions] WHERE [OptionValue] = 'National' AND [OptionType] = 'DROPDOWN')
BEGIN
    INSERT INTO [dbo].[AnswerOptions](
	    [OptionValue],
	    [OptionType])
    VALUES 
    (
        'National',
        'DROPDOWN'
    )
END
GO

--Less than 10%
IF NOT EXISTS (SELECT * FROM [dbo].[AnswerOptions] WHERE [OptionValue] = 'Less than 10%' AND [OptionType] = 'DROPDOWN')
BEGIN
    INSERT INTO [dbo].[AnswerOptions](
	    [OptionValue],
	    [OptionType])
    VALUES 
    (
        'Less than 10%',
        'DROPDOWN'
    )
END
GO

--10 - 20%
IF NOT EXISTS (SELECT * FROM [dbo].[AnswerOptions] WHERE [OptionValue] = '10 - 20%' AND [OptionType] = 'DROPDOWN')
BEGIN
    INSERT INTO [dbo].[AnswerOptions](
	    [OptionValue],
	    [OptionType])
    VALUES 
    (
        '10 - 20%',
        'DROPDOWN'
    )
END
GO

--20 – 40%
IF NOT EXISTS (SELECT * FROM [dbo].[AnswerOptions] WHERE [OptionValue] = '20 – 40%' AND [OptionType] = 'DROPDOWN')
BEGIN
    INSERT INTO [dbo].[AnswerOptions](
	    [OptionValue],
	    [OptionType])
    VALUES 
    (
        '20 – 40%',
        'DROPDOWN'
    )
END
GO

--Over 40%
IF NOT EXISTS (SELECT * FROM [dbo].[AnswerOptions] WHERE [OptionValue] = 'Over 40%' AND [OptionType] = 'DROPDOWN')
BEGIN
    INSERT INTO [dbo].[AnswerOptions](
	    [OptionValue],
	    [OptionType])
    VALUES 
    (
        'Over 40%',
        'DROPDOWN'
    )
END
GO