CREATE PROCEDURE CW1.AddGeocache (
    @Location AS INT 
)
AS
BEGIN
    BEGIN TRANSACTION

        BEGIN TRY
            DECLARE @Error NVARCHAR(MAX);

            SELECT @Location = Location FROM CW1.Geocache
            WHERE Location = @Location

            IF @Location IS NULL
            BEGIN 
                INSERT INTO CW1.Geocache (Location)
                VALUES (@Location)
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