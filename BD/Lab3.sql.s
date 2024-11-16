--Sql Homework--

--First Part--
--Point A--

CREATE PROCEDURE modifyColumnType
    @tableName VARCHAR(50),
    @columnName VARCHAR(50),
    @newType VARCHAR(50),
    @oldType VARCHAR(50)
AS
BEGIN
    PRINT 'Procedure modifyColumn has been created succesfully';
END;
GO


ALTER PROCEDURE [dbo].[modifyColumnType]
    (@tableName VARCHAR(50), @columnName VARCHAR(50), @newType VARCHAR(50), @oldType VARCHAR(50)) 
AS
BEGIN
    DECLARE @query VARCHAR(1000);  -- Increased the size of the query to accommodate longer statements
    SET @query = 'ALTER TABLE ' + @tableName + ' ALTER COLUMN ' + @columnName + ' ' + @newType;
    
    -- Print the generated query for debugging purposes
    PRINT @query;

    -- Execute the dynamic SQL
    EXEC(@query);

    -- Log the operation in the version table
    DECLARE @versionNr INT;
    SELECT @versionNr = MAX(VersionID) FROM DataBaseVersion;
    INSERT INTO DataBaseVersion (VersionID, UsedProcedure, UsedParameters) 
        VALUES (@versionNr + 1, 'modifyColumnType', @tableName + '|' + @columnName + '|' + @newType + '|' + @oldType);

    -- Update the current version in the version table
    DECLARE @currentVersion VARCHAR(10);
    SELECT @currentVersion = actualVersion FROM ActualVersionOfTheDatabase;
    DECLARE @newVersion VARCHAR(10);
    SELECT @newVersion = MAX(VersionID) FROM DataBaseVersion;
    
    -- Update current version
    UPDATE ActualVersionOfTheDatabase SET actualVersion = @newVersion;
    
    -- Update the previous and next version in the version table
    UPDATE DataBaseVersion SET PreviousVersion = @currentVersion WHERE VersionID = @newVersion;
    UPDATE DataBaseVersion SET NextVersion = @newVersion WHERE VersionID = @currentVersion;
END
GO



ALTER PROCEDURE [dbo].[rollbackModifyProcedure](
    @tableName VARCHAR(50),
    @columnName VARCHAR(50),
    @oldType VARCHAR(50)
)
AS
BEGIN
    DECLARE @querry VARCHAR(200); -- Increase the length to accommodate the full query
    SET @querry = 'ALTER TABLE ' + @tableName + ' ALTER COLUMN ' + @columnName + ' ' + @oldType;

    PRINT(@querry);  -- For debugging, print the query

    EXEC(@querry);
END
GO


ALTER PROCEDURE [dbo].[createDefaultConstraint](
    @tableName VARCHAR(50),
    @columnName VARCHAR(50),
    @defaultValue VARCHAR(50)
)
AS
BEGIN
    DECLARE @nameOfConstarint VARCHAR(200)
    set @nameOfConstarint = 'defaultConstarint_' + 
    @tableName + '_' + @columnName

    DECLARE @querry VARCHAR(MAX)
    SET @querry = 'ALTER TABLE ' + @tableName + 
    ' ADD CONSTRAINT ' + @nameOfConstarint + ' DEFAULT '
    + QUOTENAME(@defaultValue, '''') + ' FOR ' + 
    @columnName
    print(@querry)
    exec(@querry)

    DECLARE @versionNr INT
    SELECT @versionNr = MAX(VersionId) FROM
    DataBaseVersion
    INSERT INTO DataBaseVersion (VersionId, UsedProcedure, UsedParameters) VALUES
    (@versionNr+1,'createDefaultConstraint',@tableName + '/' + @columnName + '/' + @defaultValue)

    DECLARE @currentVersion VARCHAR(10)
    SELECT @currentVersion = actualVersion
    FROM ActualVersionOfTheDatabase
    DECLARE @newVersion VARCHAR(10)
    SELECT @newVersion = MAX(VersionID)
    FROM DataBaseVersion
    UPDATE ActualVersionOfTheDatabase SET
    actualVersion = @newVersion
    UPDATE DataBaseVersion SET
    PreviousVersion = @currentVersion WHERE VersionId = @newVersion
    Update DataBaseVersion SET
    NextVersion = @newVersion WHERE VersionID = @currentVersion

end;
GO




ALTER PROCEDURE [dbo].[createNewTable](
    @tableName VARCHAR(50),
    @columnData VARCHAR(MAX)
)
as
BEGIN
    DECLARE @querry VARCHAR(MAX)
    set @querry = 'CREATE TABLE ' + @tableName + ' (' + @columnData + ')'
    PRINT(@querry)
    EXEC(@querry)

    DECLARE @versionNr INT
    SELECT @versionNr = MAX(VersionID) from DataBaseVersion
    INSERT INTO DataBaseVersion (VersionId, UsedProcedure, UsedParameters) VALUES(@versionNr+1, 'create Table',@tableName + '/' + @columnData)

    DECLARE @currentVersion VARCHAR(10)
    SELECT @currentVersion = actualVersion From ActualVersionOfTheDatabase
    DECLARE @newVersion VARCHAR(10)
    SELECT @newVersion = MAX(VersionId) from DataBaseVersion
    UPDATE ActualVersionOfTheDatabase set actualVersion = @newVersion
    UPDATE DataBaseVersion set PreviousVersion = @currentVersion WHERE VersionId = @newVersion
    UPDATE DataBaseVersion set NextVersion = @newVersion WHERE VersionId = @currentVersion
end;
GO




ALTER procedure [dbo].[rollbackCreateDefaultConstraint](
    @tableName VARCHAR(50),
    @columnName VARCHAR(50)
)
AS
BEGIN
    DECLARE @nameOfConstraint VARCHAR(200)
    SET @nameOfConstraint = 'defaultConstarint_' +
    @tableName + '_' + @columnName
    DECLARE @querry VARCHAR(MAX)
    SET @querry = 'ALTER TABLE ' + @tableName + ' DROP CONSTRAINT ' + @nameOfConstraint 
    PRINT(@querry)
    EXEC(@querry)
end;
GO





ALTER PROCEDURE [dbo].[createNewTable](
    @tableName VARCHAR(50),
    @columnData VARCHAR(MAX)
)
as
BEGIN
    DECLARE @querry VARCHAR(MAX)
    set @querry = 'CREATE TABLE ' + @tableName + ' (' + @columnData + ')'
    PRINT(@querry)
    EXEC(@querry)

    DECLARE @versionNr INT
    SELECT @versionNr = MAX(VersionID) from DataBaseVersion
    INSERT INTO DataBaseVersion (VersionId, UsedProcedure, UsedParameters) VALUES(@versionNr+1, 'create Table',@tableName + '/' + @columnData)

    DECLARE @currentVersion VARCHAR(10)
    SELECT @currentVersion = actualVersion From ActualVersionOfTheDatabase
    DECLARE @newVersion VARCHAR(10)
    SELECT @newVersion = MAX(VersionId) from DataBaseVersion
    UPDATE ActualVersionOfTheDatabase set actualVersion = @newVersion
    UPDATE DataBaseVersion set PreviousVersion = @currentVersion WHERE VersionId = @newVersion
    UPDATE DataBaseVersion set NextVersion = @newVersion WHERE VersionId = @currentVersion
end;
GO



ALTER PROCEDURE [dbo].[rollbackCreateNewTable](
    @tabeName VARCHAR(50)
)
as
BEGIN
    declare @querry VARCHAR(MAX)
    set @querry = 'DROP TABLE ' + @tabeName
    PRINT(@querry)
    exec(@querry)
end;
GO


alter PROCEDURE addNewColumnToTable(
    @tableName VARCHAR(50),
    @columnName VARCHAR(50),
    @columnType VARCHAR(50)
)
AS
BEGIN 
    DECLARE @querry VARCHAR(100)
    SET @querry = 'ALTER TABLE ' + @tableName + ' ADD ' + @columnName + ' ' +  @columnType
    PRINT(@querry)
    EXEC(@querry)

    DECLARE @versionNr INT
	SELECT @versionNr = MAX(VersionID) FROM DataBaseVersion
	INSERT INTO DataBaseVersion (VersionID, UsedProcedure, UsedParameters) VALUES (@versionNr+1,'addColumn',@tableName + '/' + @columnName + '/' + @columnType)

	DECLARE @currentVersion VARCHAR(10)
	SELECT @currentVersion = actualVersion FROM ActualVersionOfTheDatabase
	DECLARE @newVersion VARCHAR(10)
	SELECT @newVersion = MAX(VersionID) FROM DataBaseVersion
	UPDATE ActualVersionOfTheDatabase SET actualVersion = @newVersion
	UPDATE DataBaseVersion SET PreviousVersion = @currentVersion WHERE VersionID = @newVersion
	UPDATE DataBaseVersion SET NextVersion = @newVersion WHERE VersionID = @currentVersion 
end;
go






ALTER PROCEDURE [dbo].[rollbackCreateNewTable](
    @tableName VARCHAR(50)
)
as
BEGIN
    declare @querry VARCHAR(MAX)
    set @querry = 'DROP TABLE ' + @tableName
    PRINT(@querry)
    exec(@querry)
end;
GO



ALTER PROCEDURE createForeignKey(
    @tableName VARCHAR(50),
    @columnName VARCHAR(50),
    @referencedTable VARCHAR(50),
    @referencedColumn VARCHAR(50)
)
AS
BEGIN
    -- Declare the name of the constraint
    DECLARE @nameOfConstraint VARCHAR(100);
    SET @nameOfConstraint = 'FK_' + @tableName + '_' + @columnName;

    -- Construct the dynamic SQL query
    DECLARE @query VARCHAR(MAX);
    SET @query = 'ALTER TABLE ' + @tableName + 
                 ' ADD CONSTRAINT ' + @nameOfConstraint + 
                 ' FOREIGN KEY (' + @columnName + ') REFERENCES ' + 
                 @referencedTable + '(' + @referencedColumn + ')';

    -- Print the query for debugging purposes
    PRINT(@query);

    -- Execute the query
    EXEC(@query);

    -- Versioning: Log the change in the version table
    DECLARE @versionNr INT;
    SELECT @versionNr = MAX(VersionID) FROM DataBaseVersion;

    -- Insert a new version record
    INSERT INTO DataBaseVersion (VersionID, UsedProcedure, UsedParameters) 
    VALUES (@versionNr + 1, 'createForeignKey', 
            @tableName + '/' + @columnName + '/' + @referencedTable + '/' + @referencedColumn);

    -- Update the current version
    DECLARE @currentVersion VARCHAR(10);
    SELECT @currentVersion = actualVersion FROM ActualVersionOfTheDatabase;

    DECLARE @newVersion VARCHAR(10);
    SELECT @newVersion = MAX(VersionID) FROM DataBaseVersion;

    UPDATE ActualVersionOfTheDatabase 
    SET actualVersion = @newVersion;

    UPDATE DataBaseVersion 
    SET PreviousVersion = @currentVersion 
    WHERE VersionID = @newVersion;

    UPDATE DataBaseVersion 
    SET NextVersion = @newVersion 
    WHERE VersionID = @currentVersion;
END;
GO



ALTER PROCEDURE rollbackCreateForeignKey(
    @tableName VARCHAR(50),
    @columnName VARCHAR(50)
)
AS
BEGIN
    DECLARE @nameOfConstraint VARCHAR(100)
    set @nameOfConstraint = 'FK_' + @tableName
    + '_' + @columnName

    DECLARE @querry VARCHAR(100)
    set @querry = 'ALTER TABLE ' + @tableName +
    ' DROP CONSTRAINT ' + @nameOfConstraint
    PRINT(@querry)
    EXEC(@querry)
end;
go




