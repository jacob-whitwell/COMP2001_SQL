SELECT * FROM cw1.Hint

INSERT INTO CW1.Hint (GeocacheHint, GeocacheID)
VALUES ('This is a geocache hint.', (SELECT CW1.Geocache.GeocacheID FROM CW1.Geocache WHERE CW1.Geocache.GeocacheID= 1))

INSERT INTO CW1.Geocache(GeocacheLocation, GeocacheDescription, GeocacheStatus, GeocacheType)
VALUES (123, 'This is a basic description example for a single Geocache', 'In-play', 'Default Geocache'),
(234, 'This is a more advanced description of a Geocache example, wherein the Player may or may not add lots and lots of useless text, just like this.', 'Damaged', 'Default Geocache')