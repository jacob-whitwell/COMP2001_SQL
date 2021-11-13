CREATE PROCEDURE CW1.AddGeocache (
    @GeocacheName as VARCHAR(30),
    @GeocacheLocation AS INT, 
    @GeocacheDescription VARCHAR(255),
    @GeocacheStatus VARCHAR (15),
    @GeocacheType VARCHAR(30) 
)
AS
BEGIN
    BEGIN TRANSACTION

        BEGIN TRY
            DECLARE @Error NVARCHAR(MAX);
            SELECT @GeocacheLocation = GeocacheLocation FROM CW1.Geocache
            WHERE GeocacheLocation = @GeocacheLocation

            IF @GeocacheLocation IS NULL
            BEGIN 
                INSERT INTO CW1.Geocache (GeocacheName, GeocacheLocation, GeocacheDescription, GeocacheStatus, GeocacheType)
                VALUES (@GeocacheName, @GeocacheLocation, @GeocacheDescription, @GeocacheStatus, @GeocacheType)
            END

            IF @@TRANCOUNT > 0 COMMIT;
        END TRY
        BEGIN CATCH 
            SET @Error = @Error+'Encountered an error: Location could not be set.'
            IF @@TRANCOUNT > 0
                ROLLBACK TRANSACTION
            RAISERROR(@Error, 1, 0);
        END CATCH;
END;


SELECT * FROM CW1.Geocache

EXEC CW1.AddGeocache 'Prodedure', 222, 'This is a new description', 'In-play', 'Default Geocache'