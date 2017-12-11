EXEC tSQLt.NewTestClass 'UT_FizzBuzz'
GO

CREATE PROCEDURE [UT_FizzBuzz].[test GetFizzBuzz given input is 1 should return '1']
AS
BEGIN
	-- Arrange
DECLARE @input int = 1;
DECLARE @expected varchar(10) = '1';
DECLARE @result varchar(10);
	-- Act
	SELECT @result = dbo.GetFizzBuzz(@input);
	-- Assert
	EXEC tSQLt.AssertEquals @expected, @result;
END
GO

CREATE PROCEDURE [UT_FizzBuzz].[test GetFizzBuzz given input is 2 should return '2']
AS
BEGIN
	-- Arrange
DECLARE @input int = 2
DECLARE @expected varchar(10) = '2';
DECLARE @result varchar(10);
	-- Act
	SELECT @result = dbo.GetFizzBuzz(@input);
	-- Assert
	EXEC tSQLt.AssertEquals @expected, @result;
END
GO

CREATE PROCEDURE [UT_FizzBuzz].[test GetFizzBuzz given input is 3 should return 'Fizz']
AS
BEGIN
	-- Arrange
DECLARE @input int = 3
DECLARE @expected varchar(10) = 'Fizz';
DECLARE @result varchar(10);
	-- Act
	SELECT @result = dbo.GetFizzBuzz(@input);
	-- Assert
	EXEC tSQLt.AssertEquals @expected, @result;
END
GO

CREATE PROCEDURE [UT_FizzBuzz].[test GetFizzBuzz given input is 4 should return '4']
AS
BEGIN
	-- Arrange
DECLARE @input int = 4
DECLARE @expected varchar(10) = '4';
DECLARE @result varchar(10);
	-- Act
	SELECT @result = dbo.GetFizzBuzz(@input);
	-- Assert
	EXEC tSQLt.AssertEquals @expected, @result;
END
GO

CREATE PROCEDURE [UT_FizzBuzz].[test GetFizzBuzz given input is 5 should return 'Buzz']
AS
BEGIN
	-- Arrange
DECLARE @input int = 5
DECLARE @expected varchar(10) = 'Buzz';
DECLARE @result varchar(10);
	-- Act
	SELECT @result = dbo.GetFizzBuzz(@input);
	-- Assert
	EXEC tSQLt.AssertEquals @expected, @result;
END
GO

CREATE PROCEDURE [UT_FizzBuzz].[test GetFizzBuzz given input is 6 should return 'Fizz']
AS
BEGIN
	-- Arrange
DECLARE @input int = 6
DECLARE @expected varchar(10) = 'Fizz';
DECLARE @result varchar(10);
	-- Act
	SELECT @result = dbo.GetFizzBuzz(@input);
	-- Assert
	EXEC tSQLt.AssertEquals @expected, @result;
END
GO

CREATE PROCEDURE [UT_FizzBuzz].[test GetFizzBuzz given input is 9 should return 'Fizz']
AS
BEGIN
	-- Arrange
DECLARE @input int = 9
DECLARE @expected varchar(10) = 'Fizz';
DECLARE @result varchar(10);
	-- Act
	SELECT @result = dbo.GetFizzBuzz(@input);
	-- Assert
	EXEC tSQLt.AssertEquals @expected, @result;
END
GO

CREATE PROCEDURE [UT_FizzBuzz].[test GetFizzBuzz given input is 10 should return 'Buzz']
AS
BEGIN
	-- Arrange
DECLARE @input int = 10
DECLARE @expected varchar(10) = 'Buzz';
DECLARE @result varchar(10);
	-- Act
	SELECT @result = dbo.GetFizzBuzz(@input);
	-- Assert
	EXEC tSQLt.AssertEquals @expected, @result;
END
GO

CREATE PROCEDURE [UT_FizzBuzz].[test GetFizzBuzz given input is 15 should return 'FizzBuzz']
AS
BEGIN
	-- Arrange
DECLARE @input int = 15
DECLARE @expected varchar(10) = 'FizzBuzz';
DECLARE @result varchar(10);
	-- Act
	SELECT @result = dbo.GetFizzBuzz(@input);
	-- Assert
	EXEC tSQLt.AssertEquals @expected, @result;
END
GO

CREATE PROCEDURE [UT_FizzBuzz].[test GetFizzBuzz given input is 20 should return 'Buzz']
AS
BEGIN
	-- Arrange
DECLARE @input int = 20
DECLARE @expected varchar(10) = 'Buzz';
DECLARE @result varchar(10);
	-- Act
	SELECT @result = dbo.GetFizzBuzz(@input);
	-- Assert
	EXEC tSQLt.AssertEquals @expected, @result;
END
GO

CREATE PROCEDURE [UT_FizzBuzz].[test GetFizzBuzz given input is 30 should return 'FizzBuzz']
AS
BEGIN
	-- Arrange
DECLARE @input int = 30
DECLARE @expected varchar(10) = 'FizzBuzz';
DECLARE @result varchar(10);
	-- Act
	SELECT @result = dbo.GetFizzBuzz(@input);
	-- Assert
	EXEC tSQLt.AssertEquals @expected, @result;
END
GO

CREATE PROCEDURE [UT_FizzBuzz].[test GetFizzBuzzResults given input is 1 should return single result in table]
AS
BEGIN
	-- Arrange
DECLARE @input int = 1;
DECLARE @expected int = 1;
DECLARE @result int
	-- Act
	SELECT @result = COUNT(*) FROM [dbo].[GetFizzBuzzResults](@input);

	-- Assert
	EXEC tSQLt.AssertEquals @expected, @result
END
GO

CREATE PROCEDURE [UT_FizzBuzz].[test GetFizzBuzzResults given input is 2 should return two results in table]
AS
BEGIN
	-- Arrange
DECLARE @input int = 2;
DECLARE @expected int = 2;
DECLARE @result int
	-- Act
	SELECT @result = COUNT(*) FROM [dbo].[GetFizzBuzzResults](@input);

	-- Assert
	EXEC tSQLt.AssertEquals @expected, @result
END
GO

CREATE PROCEDURE [UT_FizzBuzz].[test GetFizzBuzzResults given input is 3 should return many results in table]
AS
BEGIN
	-- Arrange
DECLARE @input int = 3;
DECLARE @expected int = 3;
DECLARE @result int
	-- Act
	SELECT @result = COUNT(*) FROM [dbo].[GetFizzBuzzResults](@input);

	-- Assert
	EXEC tSQLt.AssertEquals @expected, @result
END
GO

CREATE PROCEDURE [UT_FizzBuzz].[test GetFizzBuzzResults given input is 3 should return first three fizzbuzz results]
AS
BEGIN
	-- Arrange
DECLARE @input int = 3;
CREATE TABLE #Expected (id int, result varchar(10));
CREATE TABLE #Actual (id int identity(1,1), result varchar(10));

	INSERT #Expected VALUES (1, '1');
	INSERT #Expected VALUES (2, '2');
	INSERT #Expected VALUES (3, 'Fizz');
	-- Act
	INSERT #Actual (result)
	SELECT result 
	FROM [dbo].[GetFizzBuzzResults](@input);

	-- Assert
	EXEC tSQLt.AssertEqualsTable #Expected, #Actual
END
GO

CREATE PROCEDURE [UT_FizzBuzz].[test GetFizzBuzzResults ACCEPTANCE]
AS
BEGIN
	-- Arrange
DECLARE @input int = 51;
CREATE TABLE #Expected (id int, result varchar(10));
CREATE TABLE #Actual (id int identity(1,1), result varchar(10));

	INSERT #Expected VALUES (1, '1');
	INSERT #Expected VALUES (2, '2');
	INSERT #Expected VALUES (3, 'Fizz');
	INSERT #Expected VALUES (5, 'Buzz');
	INSERT #Expected VALUES (15, 'FizzBuzz');
	-- Act
	INSERT #Actual
	SELECT result 
	FROM [dbo].[GetFizzBuzzResults](@input);

	DELETE FROM #Actual
	WHERE id NOT IN (1,2,3,5,15);
	
	-- Assert
	EXEC tSQLt.AssertEqualsTable #Expected, #Actual
END
GO
EXEC tSQLt.run 'UT_FizzBuzz';