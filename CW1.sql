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

