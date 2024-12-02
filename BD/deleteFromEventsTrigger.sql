create TRIGGER deleteFromEvents
ON Events
AFTER DELETE
AS
BEGIN
    DECLARE @RowsAfected INT;
    SET @RowsAfected = @@ROWCOUNT

    INSERT INTO Logs(LogDate,ActionType,TableName,AffectedRows)
    VALUES(GETDATE(),'Delete','Events',@RowsAfected);
END;

