DROP TABLE CW1.Hint, CW1.PlayerGeocache, CW1.Player, CW1.Treasure, CW1.Geocache
DROP TABLE CW1.TimesFound

ALTER TABLE cw1.geocache
drop constraint fk_cache_times_found

ALTER TABLE cw1.TimesFound
drop constraint fk_times_found_geocacheID

SELECT * FROM CW1.Geocache
SELECT * FROM CW1.Player
SELECT * FROM CW1.PlayerGeocache
SELECT * FROM CW1.Treasure
SELECT * FROM CW1.TimesFound

UPDATE CW1.PlayerGeocache
SET TimesFound = 20
WHERE GeocacheID = 12


INSERT INTO CW1.Geocache(GeocacheName, GeocacheLocation, GeocacheDescription, GeocacheStatus, GeocacheType)
VALUES ('Lamppost Cache', 3321, 'This is the first cache I made and its in a lamppost!', 'Maintenance', 'Mystery or Puzzle Caches'),
('Tree', 111, 'Its in a tree...', 'In-play', 'Default Geocache'),
('My first Cache', 123, 'This is a basic description example for a single Geocache', 'In-play', 'Default Geocache'),
('Golden Nut', 234, 'This is a more advanced description of a Geocache example, wherein the Player may or may not add lots and lots of useless text, just like this.', 'Damaged', 'Default Geocache')

INSERT INTO CW1.Player (PlayerName)
VALUES ('Jacob'),
('Luke'),
('Destina'),
('GeocacheFinder92')


DELETE FROM CW1.Playergeocache 


INSERT INTO CW1.PlayerGeocache(PlayerID, GeoCacheID)
VALUES ((SELECT CW1.Player.PlayerID FROM CW1.Player WHERE CW1.Player.PlayerID = 1), (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 5)),
((SELECT CW1.Player.PlayerID FROM CW1.Player WHERE CW1.Player.PlayerID = 1), (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 5)),
((SELECT CW1.Player.PlayerID FROM CW1.Player WHERE CW1.Player.PlayerID = 2), (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 5)),
((SELECT CW1.Player.PlayerID FROM CW1.Player WHERE CW1.Player.PlayerID = 3), (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 5)),
((SELECT CW1.Player.PlayerID FROM CW1.Player WHERE CW1.Player.PlayerID = 4), (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 5)),
((SELECT CW1.Player.PlayerID FROM CW1.Player WHERE CW1.Player.PlayerID = 5), (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 5)),
((SELECT CW1.Player.PlayerID FROM CW1.Player WHERE CW1.Player.PlayerID = 7), (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 5)),
((SELECT CW1.Player.PlayerID FROM CW1.Player WHERE CW1.Player.PlayerID = 8), (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 5)),
((SELECT CW1.Player.PlayerID FROM CW1.Player WHERE CW1.Player.PlayerID = 9), (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 5)),
((SELECT CW1.Player.PlayerID FROM CW1.Player WHERE CW1.Player.PlayerID = 10), (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 5)),
((SELECT CW1.Player.PlayerID FROM CW1.Player WHERE CW1.Player.PlayerID = 11), (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 5)),
((SELECT CW1.Player.PlayerID FROM CW1.Player WHERE CW1.Player.PlayerID = 12), (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 5)),
((SELECT CW1.Player.PlayerID FROM CW1.Player WHERE CW1.Player.PlayerID = 13), (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 5)),
((SELECT CW1.Player.PlayerID FROM CW1.Player WHERE CW1.Player.PlayerID = 14), (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 5)),
((SELECT CW1.Player.PlayerID FROM CW1.Player WHERE CW1.Player.PlayerID = 15), (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 5)),
((SELECT CW1.Player.PlayerID FROM CW1.Player WHERE CW1.Player.PlayerID = 16), (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 5)),
((SELECT CW1.Player.PlayerID FROM CW1.Player WHERE CW1.Player.PlayerID = 17), (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 5)),
((SELECT CW1.Player.PlayerID FROM CW1.Player WHERE CW1.Player.PlayerID = 18), (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 5)),
((SELECT CW1.Player.PlayerID FROM CW1.Player WHERE CW1.Player.PlayerID = 19), (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 5)),
((SELECT CW1.Player.PlayerID FROM CW1.Player WHERE CW1.Player.PlayerID = 20), (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 5))



INSERT INTO CW1.Treasure(GeocacheTreasureItem, GeocacheID)
VALUES ('Bolt', (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 4)),
('Book', (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 5)),
('Army man', (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 6))



INSERT INTO CW1.Hint (GeocacheHint, GeocacheID)
VALUES ('Look in the tree', (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 4)),
('Look underneath the metal fence', (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 5)),
('There you will find a magnetic nut', (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID = 6))

SELECT * FROM CW1.Geocache

DECLARE @message varchar(250);
DECLARE @newID INT;
EXEC CW1.CreateGeocache 'New test cache', 413, 'Testing if hint works', 'In-Play', 'Default', 'This is a test hint', @newID OUTPUT, @message OUTPUT
SELECT @message