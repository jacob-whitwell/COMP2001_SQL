CREATE SCHEMA CW1

CREATE TABLE CW1.Geocache (
    -- auto increment each ID for the cache
    GeocacheID INT IDENTITY(1, 1) NOT NULL,
    GeocacheLocation GEOGRAPHY NOT NULL, -- geograpghy datatype allows us to use coordinates
    GeocacheDescription VARCHAR(255) NOT NULL,
    GeocacheStatus VARCHAR(15) NOT NULL,
    GeocacheType VARCHAR(20) NOT NULL,

    CONSTRAINT pk_cache PRIMARY KEY (
        GeocacheID
    )
)

CREATE TABLE CW1.Hint (
    GeocacheHintID INT IDENTITY(1, 1) NOT NULL,
    GeocacheHint VARCHAR(255) NOT NULL,
    GeocacheID INT NOT NULL,


    CONSTRAINT pk_hint PRIMARY KEY (
        GeocacheHintID
    ),

    CONSTRAINT fk_hint_cacheID FOREIGN KEY (GeocacheID) REFERENCES CW1.Geocache(GeocacheID)
)

CREATE TABLE CW1.Treasure (
    GeocacheTreasureID INT IDENTITY(1, 1) NOT NULL,
    GeocacheTreasureItem VARCHAR(255) NOT NULL,
    GeocacheID INT NOT NULL,

    CONSTRAINT pk_treasure PRIMARY KEY (GeocacheTreasureID),
    CONSTRAINT fk_treasure_cacheID FOREIGN KEY (GeocacheID) REFERENCES CW1.Geocache(GeocacheID)
)

CREATE TABLE CW1.Found (
    PlayerID INT IDENTITY(1, 1) NOT NULL,
    GeocacheID INT NOT NULL,

    CONSTRAINT pk_found PRIMARY KEY (PlayerID)
    CONSTRAINT fk_found_cacheID FOREIGN KEY (GeocacheID) REFERENCES CW1.Geocache(GeocacheID)
)