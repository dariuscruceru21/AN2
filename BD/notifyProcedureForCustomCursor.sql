SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NotifySponsor]
    @SponsorId INT,
    @EventTitle VARCHAR(50),
    @EventDate DATE
AS
BEGIN
    DECLARE @Message VARCHAR(255);

   
    SET @Message = 'You are a sponsor for the event "' + @EventTitle + '" scheduled on ' + CAST(@EventDate AS VARCHAR) + '.';

    -- Log the notification in the NotificationLog table
    INSERT INTO NotificationLog (SponsorId, EventId, NotificationDate, Message)
    VALUES (@SponsorId, (SELECT EventId FROM Events WHERE Title = @EventTitle), GETDATE(), @Message);

    -- debugging/logging purposes--
    PRINT 'Notified Sponsor ' + CAST(@SponsorId AS VARCHAR) + ' about event: ' + @EventTitle;

   
END;
GO
