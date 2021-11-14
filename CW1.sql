CREATE SCHEMA CW1

CREATE TABLE CW1.Geocache (
    -- auto increment each ID for the cache
    GeocacheID INT IDENTITY(1, 1) NOT NULL,
    GeocacheName VARCHAR(30) NOT NULL,
    GeocacheLocation INT NOT NULL, -- using int for dummy data. Geography too complicated at the moment
    GeocacheDescription VARCHAR(255) NOT NULL,
    GeocacheStatus VARCHAR(15) NOT NULL,
    GeocacheType VARCHAR(30) NOT NULL,
    TimesFound INT DEFAULT 0,

    
    CONSTRAINT pk_cache PRIMARY KEY (GeocacheID),
)

CREATE TABLE CW1.Hint (
    GeocacheHintID INT IDENTITY(1, 1) NOT NULL,
    GeocacheHint VARCHAR(255) NOT NULL,
    GeocacheID INT NOT NULL,

    CONSTRAINT pk_hint PRIMARY KEY (GeocacheHintID),
    CONSTRAINT fk_hint_cacheID FOREIGN KEY (GeocacheID) REFERENCES CW1.Geocache(GeocacheID)
)

CREATE TABLE CW1.Treasure (
    GeocacheTreasureID INT IDENTITY(1, 1) NOT NULL,
    GeocacheID INT NOT NULL,
    GeocacheTreasureItem VARCHAR(255) NOT NULL,
   
    CONSTRAINT pk_treasure PRIMARY KEY (GeocacheTreasureID),
    CONSTRAINT fk_treasure_cacheID FOREIGN KEY (GeocacheID) REFERENCES CW1.Geocache(GeocacheID)
)

CREATE TABLE CW1.Player (
    PlayerID INT IDENTITY(1, 1) NOT NULL,
    PlayerName VARCHAR(20) NOT NULL,
    CONSTRAINT pk_playerID PRIMARY KEY (PlayerID)
)

CREATE TABLE CW1.PlayerGeocache (
    PlayerID INT NOT NULL,
    GeocacheID INT NOT NULL,
    TimesFound INT DEFAULT 0,

    CONSTRAINT pk_player_geocache PRIMARY KEY (PlayerID, GeocacheID)

    --CONSTRAINT fk_found_playerID FOREIGN KEY (PlayerID) REFERENCES CW1.Player(PlayerID),
    --CONSTRAINT fk_found_cacheID FOREIGN KEY (GeocacheID) REFERENCES CW1.Geocache(GeocacheID)
)

CREATE TABLE CW1.TimesFound (
    TimesFoundID INT IDENTITY(1, 1) NOT NULL,
    GeocacheID INT NOT NULL,
    TimesFound INT NOT NULL,

    CONSTRAINT pk_times_found_ID PRIMARY KEY (TimesFoundID),
    CONSTRAINT fk_times_found_geocacheID FOREIGN KEY (GeocacheID) REFERENCES CW1.Geocache(GeocacheID)
)


ALTER TABLE CW1.Geocache
ADD CONSTRAINT fk_cache_times_found FOREIGN KEY (TimesFound) REFERENCES CW1.TimesFound