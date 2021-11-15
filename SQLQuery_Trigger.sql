CREATE TRIGGER CW1.CacheFound ON CW1.PlayerGeocache
AFTER INSERT, UPDATE
AS
BEGIN 
    DECLARE @CacheID int;
    DECLARE @Count int; 

-- ITS GETTING THE LAST ID, SO WE NEED TO MAKE A PROPER WHERE CLAUSE
    
    SELECT @CacheID = i.GeocacheID
    FROM CW1.PlayerGeocache as i, inserted
    WHERE i.GeocacheID = inserted.GeocacheID

    SELECT @Count = COUNT(inserted.GeocacheID)
    FROM CW1.PlayerGeocache as i, inserted
    WHERE i.GeocacheID = inserted.GeocacheID

    UPDATE CW1.Geocache
    SET TimesFound += @Count
    WHERE CW1.Geocache.GeocacheID = @CacheID

    print 'CacheID: '
    print @CacheID

    print'Found: '
    print @Count    

    IF @Count >= 20
    BEGIN
        UPDATE CW1.Geocache
        SET GeocacheStatus = 'Maintenance'
        WHERE CW1.Geocache.GeocacheID = @CacheID
    END
END
GO

ALTER TABLE CW1.PlayerGeocache
ENABLE TRIGGER CacheFound
GO

DROP TRIGGER CW1.CacheFound


-- Get the CacheID From the new PlayerGeocache insert
-- From that, it should be possible to increase 
-- the Geocache table Found Counter.