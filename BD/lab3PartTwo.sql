
ALTER PROCEDURE [dbo].[changeDatabaseVersion](@versionNumber INT)
AS
    BEGIN
            DECLARE @currentVersion INT
            SELECT @currentVersion = actualVersion From ActualVersionOfTheDatabase

            --IF @versionNumber < @currentVersion--
            WHILE @versionNumber < @currentVersion
                BEGIN
                        --We take data from the table--
                        DECLARE @procedure VARCHAR(50)--Procedure from the table
                        SELECT @procedure = UsedProcedure FROM DataBaseVersion WHERE VersionId = @currentVersion

                        DECLARE @parameters VARCHAR(MAX) --Parameters from the table
                        SELECT @parameters = UsedParameters FROM DataBaseVersion WHERE VersionId = @currentVersion

                        --spliting the parameter list--
                        DECLARE @splitedValues TABLE(ValueNr INT, [Value] VARCHAR(200))
                        INSERT INTO @splitedValues ([Value]) SELECT value FROM string_split(@parameters,'/')

                        DECLARE @param1 VARCHAR(MAX)
                        DECLARE @param2 VARCHAR(MAX)
                        DECLARE @param3 VARCHAR(MAX)
                        DECLARE @param4 VARCHAR(MAX)
                        DECLARE @param5 VARCHAR(MAX)

                        DECLARE @counter INT = 1

                        DECLARE @currentValue VARCHAR(MAX);

                        DECLARE valueCursor CURSOR FOR
                        SELECT [Value] from @splitedValues

                        OPEN valueCursor;

                        FETCH NEXT FROM valueCursor INTO @currentValue;

                        WHILE @@FETCH_STATUS = 0
                        BEGIN  
                                IF @counter = 1 set @param1 = @currentValue;
                                IF @counter = 2 set @param2 = @currentValue;
                                IF @counter = 3 set @param3 = @currentValue;
                                IF @counter = 4 set @param4 = @currentValue;
                                IF @counter = 5 set @param5 = @currentValue;

                                SET @counter = @counter + 1;

                                FETCH NEXT FROM valueCursor INTO @CurrentValue;
                        END

                        CLOSE valueCursor;
                        DEALLOCATE valueCursor;

                        DELETE FROM @splitedValues

                        SET @counter = @counter - 1

                        IF (@procedure = 'modifyColumnType') exec rollbackModifyProcedure @param1, @param2, @param4
                        IF (@procedure = 'createDefaultConstraint') exec rollbackCreateDefaultConstraint @param1, @param2
                        IF (@procedure = 'createNewTable') exec rollbackCreateNewTable @param1
                        IF (@procedure = 'addNewColumnToTable') exec rollbackColumnToTable @param1, @param2
                        IF (@procedure = 'createForeignKey') exec rollbackCreateForeignKey @param1, @param2

                        SELECT @currentVersion = PreviousVersion FROM DataBaseVersion WHERE VersionId = @currentVersion;
                END

            --case when @currentVersion < @versionNumber
            WHILE @currentVersion < @versionNumber
                BEGIN
                    SELECT @currentVersion = NextVersion FROM DataBaseVersion WHERE VersionId  = @currentVersion;

                    SELECT @procedure = UsedProcedure FROM DataBaseVersion WHERE VersionId = @currentVersion
                    SELECT @parameters = UsedParameters FROM DataBaseVersion WHERE VersionId = @currentVersion

                    INSERT INTO @splitedValues ([Value]) SELECT value FROM string_split(@parameters, '/')

                    SET @counter = 1

                    DECLARE valueCursor CURSOR FOR
                    SELECT [Value] FROM @splitedValues;

                    OPEN valueCursor;

                    FETCH NEXT FROM valueCursor INTO @currentValue;

                    WHILE @@FETCH_STATUS = 0
                    BEGIN
                            IF @counter = 1 set @param1 = @currentValue;
                            IF @counter = 2 set @param2 = @currentValue;
                            IF @counter = 3 set @param3 = @currentValue;
                            IF @counter = 4 set @param4 = @currentValue;
                            IF @counter = 5 set @param5 = @currentValue;

                            SET @counter = @counter + 1;

                            FETCH NEXT FROM valueCursor INTO @currentValue;
                    END

                    CLOSE valueCursor;
                    DEALLOCATE valueCursor;

                    DELETE FROM @splitedValues

                    SET @counter = @counter - 1


                    IF (@procedure = 'modifyColumnType') exec modifyColumnType @param1,@param2,@param3,@param4
                    IF (@procedure = 'createDefaultConstraint') exec createDefaultConstraint @param1,@param2,@param3
                    IF (@procedure = 'createNewTable') exec createNewTable @param1,@param2
                    If (@procedure = 'addNewColumnToTable') exec addNewColumnToTable @param1,@param2,@param3
                    IF (@procedure = 'createForeignKey') exec createForeignKey @param1,@param2,@param3,@param4


                    DELETE FROM DataBaseVersion 
                    WHERE VersionId = (SELECT MAX(VersionId) FROM DataBaseVersion)
                END

                UPDATE ActualVersionOfTheDatabase SET actualVersion = @versionNumber
            END
                    
GO
