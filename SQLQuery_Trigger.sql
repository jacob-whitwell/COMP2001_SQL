CREATE TRIGGER CW1.CacheFound ON CW1.Geocache
AFTER INSERT, UPDATE
AS
BEGIN 
    DECLARE @CacheID int;
    DECLARE @TimesFound int;

    SELECT @TimesFound = COUNT(GeocacheID)
    FROM CW1.Geocache
    WHERE @CacheID = GeocacheID

    print 'Times found: '+@TimesFound
END
GO

ALTER TABLE CW1.Geocache
ENABLE TRIGGER CacheFound
GO

DROP TRIGGER CW1.CacheFound


-- Get the CacheID From the new PlayerGeocache insert
-- From that, it should be possible to increase 
-- the Geocache table Found Counter.