create FUNCTION dbo.fn_isValidEvent
(
    @EventId INT
)
RETURNS BIT
AS 
BEGIN
    DECLARE @IsValid BIT = 0;
    DECLARE @Capacity INT;
    DECLARE @CurrentPartcipants INT;
    DECLARE @EventDate DATE;
    DECLARE @EventExists BIT;

    --Check if event exists--
    SELECT @EventExists = CASE WHEN COUNt(*) > 0 THEN 1 ELSE 0 END
    FROM Events
    WHERE EventId = @EventId

    IF @EventExists = 0
     RETURN 0;

    -- Get event capacity--
    SELECT @Capacity = v.Capacity , @EventDate = e.Date
    FROM Events as e
    JOIN EventVenues ev ON e.EventId = ev.EventId
    JOIN Venues v ON ev.VenueId = v.VenueId
    WHERE e.EventId = @EventId;

    --get current number of participants--
    SELECT @CurrentPartcipants = COUNT(*)
    FROM Participants
    WHERE EventId = @EventId

    -- Check if event is valid (exists, has capacity and hasn't taken place)--
    IF @EventExists = 1 AND @Capacity > @CurrentPartcipants AND @EventDate > GETDATE()
        SET @IsValid = 1;

    RETURN @IsValid;
END;

