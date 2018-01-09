EXEC tSQLt.NewTestClass 'UT_AgeCalc';
GO

CREATE PROCEDURE [UT_AgeCalc].[test CalculateAge given it's the day you were born]
AS
BEGIN
	-- Arrange
DECLARE @DOB datetime = '1989-05-22'
DECLARE @CurrentDate datetime = '1989-05-22'
DECLARE @Result int
DECLARE @Expected int = 0;
	-- Act
	SELECT @Result = [dbo].[CalculateAge](@DOB, @CurrentDate);
	-- Assert
	EXEC tSQLt.AssertEquals @Expected, @Result

END
GO

CREATE PROCEDURE [UT_AgeCalc].[test CalculateAge given it's your first birthday]
AS
BEGIN
	-- Arrange
DECLARE @DOB datetime = '1989-05-22'
DECLARE @CurrentDate datetime = '1990-05-22'
DECLARE @Result int
DECLARE @Expected int = 1;
	-- Act
	SELECT @Result = [dbo].[CalculateAge](@DOB, @CurrentDate);
	-- Assert
	EXEC tSQLt.AssertEquals @Expected, @Result

END
GO

CREATE PROCEDURE [UT_AgeCalc].[test CalculateAge given it's your second birthday]
AS
BEGIN
	-- Arrange
DECLARE @DOB datetime = '1989-05-22'
DECLARE @CurrentDate datetime = '1991-05-22'
DECLARE @Result int
DECLARE @Expected int = 2;
	-- Act
	SELECT @Result = [dbo].[CalculateAge](@DOB, @CurrentDate);
	-- Assert
	EXEC tSQLt.AssertEquals @Expected, @Result

END
GO

CREATE PROCEDURE [UT_AgeCalc].[test CalculateAge given it's the day before your first birthday]
AS
BEGIN
	-- Arrange
DECLARE @DOB datetime = '1989-05-22'
DECLARE @CurrentDate datetime = '1990-05-21'
DECLARE @Result int
DECLARE @Expected int = 0;
	-- Act
	SELECT @Result = [dbo].[CalculateAge](@DOB, @CurrentDate);
	-- Assert
	EXEC tSQLt.AssertEquals @Expected, @Result

END
GO

CREATE PROCEDURE [UT_AgeCalc].[test CalculateAge given it's the month before your first birthday]
AS
BEGIN
	-- Arrange
DECLARE @DOB datetime = '1989-05-22'
DECLARE @CurrentDate datetime = '1990-04-22'
DECLARE @Result int
DECLARE @Expected int = 0;
	-- Act
	SELECT @Result = [dbo].[CalculateAge](@DOB, @CurrentDate);
	-- Assert
	EXEC tSQLt.AssertEquals @Expected, @Result

END
GO

CREATE PROCEDURE [UT_AgeCalc].[test CalculateAge given it's the day before the month after your first birthday]
AS
BEGIN
	-- Arrange
DECLARE @DOB datetime = '1989-05-22'
DECLARE @CurrentDate datetime = '1990-06-21'
DECLARE @Result int
DECLARE @Expected int = 1;
	-- Act
	SELECT @Result = [dbo].[CalculateAge](@DOB, @CurrentDate);
	-- Assert
	EXEC tSQLt.AssertEquals @Expected, @Result

END
GO

CREATE PROCEDURE [UT_AgeCalc].[test CalculateAge given it's your first birthday and you were born on a leap day]
AS
BEGIN
	-- I am assuming that that the birthday of a person born on 29 Feb in a leap year has there birthday on 28 Feb on a non leap year.
	-- My choice of 29 Feb as the birthday for a person born on 29 Feb is based on the result returned by the DATEADD sql function
	-- e.g. DATEADD(year, 1, '2008-02-29') which returns 2009-02-28
	-- See: https://en.wikipedia.org/wiki/February_29 Born on February 29.
	-- Arrange
DECLARE @DOB datetime = '2008-02-29'
DECLARE @CurrentDate datetime = '2009-02-28'
DECLARE @Result int
DECLARE @Expected int = 1;
	-- Act
	SELECT @Result = [dbo].[CalculateAge](@DOB, @CurrentDate);
	-- Assert
	EXEC tSQLt.AssertEquals @Expected, @Result
END
GO

CREATE PROCEDURE [UT_AgeCalc].[test CalculateAge given it's your first birthday and it has crossed a leap day]
AS
BEGIN
	-- Arrange
DECLARE @DOB datetime = '2007-05-22'
DECLARE @CurrentDate datetime = '2008-05-22' -- this date falls after 2008-02-29 (meaning that 366 days have elapsed between the two dates)
DECLARE @Result int
DECLARE @Expected int = 1;
	-- Act
	SELECT @Result = [dbo].[CalculateAge](@DOB, @CurrentDate);
	-- Assert
	EXEC tSQLt.AssertEquals @Expected, @Result

END
GO

EXEC tSQLt.Run 'UT_AgeCalc';