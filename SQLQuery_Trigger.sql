CREATE TRIGGER CW1.CacheFound ON CW1.PlayerGeocache
AFTER INSERT, UPDATE
AS
BEGIN 
    DECLARE @CacheID int;
    

    SELECT @CacheID = GeocacheID
    FROM CW1.PlayerGeocache as inserted
    WHERE GeocacheID = inserted.GeocacheID

    print 'CacheID: '
    print @CacheID
END
GO

ALTER TABLE CW1.PlayerGeocache
ENABLE TRIGGER CacheFound
GO

DROP TRIGGER CW1.CacheFound


-- Get the CacheID From the new PlayerGeocache insert
-- From that, it should be possible to increase 
-- the Geocache table Found Counter.