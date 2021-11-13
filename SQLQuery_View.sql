-- View: Obtain a view of the hints for a geocache.
CREATE VIEW CW1.ShowHints AS
SELECT CW1.Geocache.GeocacheID, CW1.Geocache.GeocacheName, CW1.Hint.GeocacheHint, CW1.Hint.ID
FROM CW1.Geocache, CW1.Hint
WHERE CW1.Geocache.GeocacheID = CW1.Hint.GeocacheID



SELECT * FROM CW1.ShowHints

SELECT * FROM CW1.Geocache