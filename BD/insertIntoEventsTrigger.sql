create trigger updateEvents
ON Events
AFTER UPDATE
AS
BEGIN
    DECLARE @RowsAfected INT;
    SET @RowsAfected = @@ROWCOUNT;

    INSERT INTO Logs(LogDate,ActionType,TableName,AffectedRows)
    VALUES(GETDATE(),'Update','Events',@RowsAfected)
END;

