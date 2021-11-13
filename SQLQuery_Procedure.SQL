--DROP PROCEDURE CW1.TestCreateGeocache
CREATE PROCEDURE CW1.CreateGeocache(
    @Name AS VARCHAR(30),
    @Location AS INT,
    @Description AS VARCHAR(255),
    @Status AS VARCHAR(15),
    @Type AS VARCHAR(30),

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
EXEC CW1.CreateGeocache 'Testname', 2, 'Test Description', 'In-Play', 'Default', @message OUTPUT
SELECT @message

SELECT * FROM CW1.Test

-- COULDN'T FIGURE OUT HOW TO INPUT CORRECTLY WITH STORED PROCEDURE