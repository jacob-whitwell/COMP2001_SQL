CREATE TRIGGER CW1.CacheFound ON CW1.PlayerGeocache
AFTER INSERT, UPDATE
AS
BEGIN 
    DECLARE @CacheID int;
    DECLARE @TimesFound int;

    SELECT @TimesFound = COUNT(*)
    FROM inserted
    WHERE @CacheID = inserted.GeocacheID


    IF @TimesFound >= 20
    BEGIN
        UPDATE CW1.Geocache
        SET GeocacheStatus = 'Maintenance'
        FROM inserted
        WHERE CW1.Geocache.GeocacheID = @CacheID

    END
    ELSE 
        UPDATE CW1.PlayerGeocache
        SET TimesFound += 1
        WHERE CW1.PlayerGeocache.GeocacheID = @CacheID
        
END

