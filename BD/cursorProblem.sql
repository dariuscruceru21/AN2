DECLARE @EventId INT;
DECLARE @EventTitle VARCHAR(50);
DECLARE @EventDate DATE;
DECLARE @SponsorId INT;
DECLARE @Message VARCHAR(255);

--cursor declaration--
DECLARE EventCursor CURSOR FOR
SELECT e.EventId,e.Title,e.Date
FROM Events e
WHERE e.Date > GETDATE() --upcoming events--

OPEN EventCursor

FETCH NEXT FROM EventCursor INTO @EventId,@EventTitle,@EventDate;

WHILE @@FETCH_STATUS = 0
BEGIN
        --for each event get their sponsore--
        DECLARE SponsorCursor CURSOR FOR
        SELECT ES.SponsorId
        FROM EventSponsors ES
        WHERE ES.EventId = @EventId;

        OPEN SponsorCursor;

        FETCH NEXT FROM SponsorCursor INTO @SponsorID;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- Notify the sponsor
            EXEC NotifySponsor @SponsorId, @EventTitle, @EventDate;

            FETCH NEXT FROM SponsorCursor INTO @SponsorId;
        END;

        CLOSE SponsorCursor;
        DEALLOCATE SponsorCursor;

        FETCH NEXT FROM EventCursor INTO @EventId, @EventTitle, @EventDate;
END;
CLOSE EventCursor;
DEALLOCATE EventCursor;

