IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_NAME='CalculateAge' AND ROUTINE_SCHEMA='dbo')
	DROP FUNCTION [dbo].[CalculateAge];
GO

CREATE FUNCTION [dbo].[CalculateAge]
(
	@DOB datetime,
	@CurrentDate datetime
)
RETURNS int
AS
BEGIN
DECLARE @RelativeDOB datetime = IIF(day(@DOB) = 29 AND month(@DOB) = 2, @DOB - 1, @DOB);
DECLARE @years int = DATEDIFF(YEAR, @RelativeDOB, @CurrentDate);
DECLARE @days int = DAY(@CurrentDate) - DAY(@RelativeDOB);
DECLARE @months int = MONTH(@currentDate) - MONTH(@RelativeDOB);
	
	IF ((@months < 0) OR (@months = 0 AND  @days < 0))
		RETURN @years - 1;

	RETURN @years;
END
GO