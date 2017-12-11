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
DECLARE @Age int = 0
DECLARE @BirthDayInCurrentYear datetime
	
	IF @DOB IS NULL OR @CurrentDate IS NULL RETURN @Age;
	IF @CurrentDate < @DOB RETURN @Age;
		
	SET @Age = DATEDIFF(year, @DOB, @CurrentDate)
	SET @BirthDayInCurrentYear = DATEADD(year, @Age, @DOB)
	IF  @CurrentDate < @BirthDayInCurrentYear  
		SET @Age = @Age - 1;
	
	RETURN @Age;
END
GO