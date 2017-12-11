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
DECLARE @Expected int = 0;
	-- Act
	SELECT @Result = [dbo].[CalculateAge](@DOB, @CurrentDate);
	-- Assert
	EXEC tSQLt.AssertEquals @Expected, @Result

END
GO

CREATE PROCEDURE [UT_AgeCalc].[test CalculateAge given it's your first birthday and you were born on a leap day]
AS
BEGIN
	-- Arrange
DECLARE @DOB datetime = '2008-02-29'
DECLARE @CurrentDate datetime = '2009-03-01'
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