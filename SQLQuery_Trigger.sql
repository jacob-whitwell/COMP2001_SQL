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


    SELECT @Count = COUNT(GeocacheID)
    FROM CW1.PlayerGeocache as inserted
    WHERE inserted.GeocacheID = GeocacheID

    print 'CacheID: '
    print @CacheID

    print'Found: '
    print @Count    
END
GO

ALTER TABLE CW1.PlayerGeocache
ENABLE TRIGGER CacheFound
GO

DROP TRIGGER CW1.CacheFound


-- Get the CacheID From the new PlayerGeocache insert
-- From that, it should be possible to increase 
-- the Geocache table Found Counter.