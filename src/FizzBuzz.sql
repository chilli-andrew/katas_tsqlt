IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME='GetFizzBuzz' AND ROUTINE_SCHEMA='dbo')
	DROP FUNCTION [dbo].[GetFizzBuzz];
GO
CREATE FUNCTION [dbo].[GetFizzBuzz]
(
	@input int
)
RETURNS varchar(10)
AS
BEGIN
	IF @input % 3 = 0 AND @input % 5 = 0
		RETURN 'FizzBuzz';

	IF @input % 5 = 0
		RETURN 'Buzz';

	IF @input % 3 = 0
		RETURN 'Fizz';

	RETURN CAST(@input AS varchar(10));
END
GO
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME='GetFizzBuzzResults' AND ROUTINE_SCHEMA='dbo')
	DROP FUNCTION [dbo].[GetFizzBuzzResults];
GO
CREATE FUNCTION [dbo].[GetFizzBuzzResults]
(
	@input int
)
RETURNS  @fizzBuzzResults TABLE (result varchar(10) not null)
BEGIN

DECLARE @count int = 1;

	WHILE @count <= @input AND @count < 1000
	BEGIN
		INSERT @fizzBuzzResults (result)
		VALUES (dbo.GetFizzBuzz(@count));
		SET @count = @count + 1;
	END

	RETURN
END 
GO