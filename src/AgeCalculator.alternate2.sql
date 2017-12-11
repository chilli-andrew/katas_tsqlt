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
	RETURN (CAST(FORMAT(@CurrentDate, 'yyyyMMdd', 'en-US') AS INT) - CAST(FORMAT(@DOB, 'yyyyMMdd', 'en-US') AS INT)) / 10000;
END
GO