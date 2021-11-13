SELECT * FROM CW1.Geocache
SELECT * FROM cw1.Hint 
SELECT * FROM CW1.Player
SELECT * FROM CW1.PlayerGeocache
SELECT * FROM CW1.Treasure

SELECT CW1.Geocache.GeoCacheID, CW1.Geocache.GeocacheName, CW1.Hint.GeocacheHint
FROM CW1.Geocache, CW1.Hint
WHERE CW1.Geocache.GeocacheID = CW1.Hint.GeocacheID

-- Inset if a player has found 


--DROP TABLE CW1.Hint, CW1.PlayerGeocache, CW1.Player, CW1.Treasure, CW1.Geocache
INSERT INTO CW1.PlayerGeocache(PlayerID, GeoCacheID)
VALUES ((SELECT CW1.Player.PlayerID FROM CW1.Player WHERE CW1.Player.PlayerID = 1), (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 2))

INSERT INTO CW1.Treasure(GeocacheTreasureItem, GeocacheID)
VALUES ('Book', (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 1)),
VALUES ('Army man', (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 1))


INSERT INTO CW1.Player (PlayerName)
VALUES ('Jacob'),
('Luke'),
('Destina'),
('GeocacheFinder92')

INSERT INTO CW1.Geocache(GeocacheName, GeocacheLocation, GeocacheDescription, GeocacheStatus, GeocacheType)
VALUES ('Tree', 111, 'Its in a tree...', 'In-play', 'Default Geocache'),
VALUES ('My first Cache', 123, 'This is a basic description example for a single Geocache', 'In-play', 'Default Geocache'),
('Golden Nut', 234, 'This is a more advanced description of a Geocache example, wherein the Player may or may not add lots and lots of useless text, just like this.', 'Damaged', 'Default Geocache')

INSERT INTO CW1.Hint (GeocacheHint, GeocacheID)
VALUES ('Look in the tree', (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 2))
VALUES ('This is a geocache hint.', (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID= 1))


