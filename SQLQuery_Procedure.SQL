--DROP PROCEDURE CW1.CreateGeocache
CREATE PROCEDURE CW1.CreateGeocache(
    @Name AS VARCHAR(30),
    @Location AS INT,
    @Description AS VARCHAR(255),
    @Status AS VARCHAR(15),
    @Type AS VARCHAR(30),
    @Hint AS VARCHAR(255),
    @newID INT = NULL OUTPUT,
    @responseMessage NVARCHAR(250) OUTPUT
)
AS
BEGIN
    BEGIN TRANSACTION
        PRINT 'Test'
        BEGIN TRY
            DECLARE @Error NVARCHAR(Max);            
            DECLARE @LocationTaken INT;

            SELECT @LocationTaken = GeocacheLocation FROM CW1.Geocache
            WHERE GeocacheLocation = @Location

            IF @LocationTaken IS NULL
            BEGIN
                INSERT INTO CW1.Geocache(GeocacheName, GeocacheLocation, GeocacheDescription, GeocacheStatus, GeocacheType)
                VALUES (@Name, @Location, @Description, @Status, @Type)
                SET @newID = SCOPE_IDENTITY();
            

                INSERT INTO CW1.Hint(GeocacheHint, GeocacheID)
                VALUES (@Hint, (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = @newId))
            END
            ELSE
                SET @responseMessage = ' Location exists :' + @LocationTaken;

            IF @@TRANCOUNT > 0 COMMIT;
        END TRY
        BEGIN CATCH
            SET @Error = @Error+':An error was encountered : NewName could not be created';
            IF @@TRANCOUNT > 0
                ROLLBACK TRANSACTION;
            RAISERROR(@Error, 1, 0);
        END CATCH
END;


DECLARE @message varchar(250);
DECLARE @newID INT;
EXEC CW1.CreateGeocache 'New test cache', 123456, 'Testing if hint works', 'In-Play', 'Default', 'This is a test hint', @newID OUTPUT, @message OUTPUT
SELECT @message

SELECT * FROM CW1.Geocache
SELECT * FROM CW1.ShowHints


-- COULDN'T FIGURE OUT HOW TO INPUT CORRECTLY WITH STORED PROCEDURE