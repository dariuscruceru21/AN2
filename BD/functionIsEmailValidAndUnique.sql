CREATE PROCEDURE sp_RegisterParticipantForEvent
    @ParticipantId INT,
    @LastName VARCHAR(50),
    @FirstName VARCHAR(50),
    @Email VARCHAR(50),
    @EventId INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Check if the event is valid (has capacity and hasn't taken place)
        IF dbo.fn_IsEventValid(@EventId) = 0
        BEGIN
            THROW 50001, 'Event is either at full capacity or has already taken place.', 1;
        END

        -- Validate email format and uniqueness
        IF dbo.fn_IsEmailValidAndUnique(@Email) = 0
        BEGIN
            THROW 50002, 'Invalid email format or email already registered.', 1;
        END

        -- Begin transaction
        BEGIN TRANSACTION

            -- Insert into Participants table
            INSERT INTO Participants (ParticipantId,LastName, FirstName, Email, EventId)
            VALUES (@ParticipantId,@LastName, @FirstName, @Email, @EventId);

            DECLARE @NewParticipantId INT = SCOPE_IDENTITY();

            -- Insert into Registrations table
            INSERT INTO Registrations (EventId, ParticipantId, RegistrationDate)
            VALUES (@EventId, @NewParticipantId, GETDATE());

        -- Commit transaction
        COMMIT TRANSACTION

        -- Return success message and new ParticipantId
        SELECT 'Participant successfully registered' AS Message, @NewParticipantId AS NewParticipantId;

    END TRY
    BEGIN CATCH
        -- Rollback transaction if an error occurred
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Re-throw the error
        THROW;
    END CATCH
END;