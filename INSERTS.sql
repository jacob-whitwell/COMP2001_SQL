--DROP TABLE CW1.Hint, CW1.PlayerGeocache, CW1.Player, CW1.Treasure, CW1.Geocache

SELECT * FROM CW1.Geocache
SELECT * FROM cw1.Hint 
SELECT * FROM CW1.Player
SELECT * FROM CW1.PlayerGeocache
SELECT * FROM CW1.Treasure


INSERT INTO CW1.PlayerGeocache(PlayerID, GeoCacheID)
VALUES ((SELECT CW1.Player.PlayerID FROM CW1.Player WHERE CW1.Player.PlayerID = 1), (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 2))


INSERT INTO CW1.Treasure(GeocacheTreasureItem, GeocacheID)
VALUES ('Bolt', (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 2)),
('Book', (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 1)),
('Army man', (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 1))


INSERT INTO CW1.Player (PlayerName)
VALUES ('Jacob'),
('Luke'),
('Destina'),
('GeocacheFinder92')


INSERT INTO CW1.Geocache(GeocacheName, GeocacheLocation, GeocacheDescription, GeocacheStatus, GeocacheType)
VALUES ('Lamppost Cache', 3321, 'This is the first cache I made and its in a lamppost!', 'Maintenance', 'Mystery or Puzzle Caches')
('Tree', 111, 'Its in a tree...', 'In-play', 'Default Geocache'),
('My first Cache', 123, 'This is a basic description example for a single Geocache', 'In-play', 'Default Geocache'),
('Golden Nut', 234, 'This is a more advanced description of a Geocache example, wherein the Player may or may not add lots and lots of useless text, just like this.', 'Damaged', 'Default Geocache')


INSERT INTO CW1.Hint (GeocacheHint, GeocacheID)
VALUES ('Look in the tree', (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 2)),
('This is a geocache hint.', (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID= 1)),
('Look underneath the metal fence', (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 3)),
('There you will find a magnetic nut', (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 3))

