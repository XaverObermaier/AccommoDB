
-- dropping everything in the right order

-- dropping booking
DROP TABLE IF EXISTS booking;

-- dropping amenities
DROP TABLE IF EXISTS accommodation_amenities;
DROP TABLE IF EXISTS amenity;

-- dropping accommodatio table 
DROP TABLE IF EXISTS accommodation;
DROP TYPE IF EXISTS public.payment_enum;  
DROP TYPE IF EXISTS public.category_enum; 

-- dropping user table 
DROP TABLE IF EXISTS "user";
DROP TYPE IF EXISTS public.gender_enum; 

-- create user table 
CREATE TYPE public.gender_enum AS ENUM ('MALE', 'FEMALE', 'OTHER');

-- create user table
CREATE TABLE "public"."user" (
    userID           SERIAL PRIMARY KEY,
    username         VARCHAR(255) NOT NULL UNIQUE,
    password_hash    VARCHAR(255) NOT NULL,
    firstname        VARCHAR(255) NOT NULL,
    lastname         VARCHAR(255) NOT NULL,
    gender           public.gender_enum, 
    birthday         DATE,
    description      TEXT,
    email            VARCHAR(255) NOT NULL,
    telephone        VARCHAR(20),
    role             VARCHAR(50) DEFAULT 'USER',
    registered_since DATE DEFAULT CURRENT_DATE
);

-- create accommodation table 
CREATE TYPE public.payment_enum AS ENUM ('per_night', 'per_week', 'per_month', 'other');
CREATE TYPE public.category_enum AS ENUM ('Hotel', 'House', 'Flat', 'Villa', 'Cabin');

CREATE TABLE accommodation (
    accommodationID    SERIAL PRIMARY KEY,
    accommodation_name VARCHAR(255) NOT NULL,
    country            VARCHAR(100) NOT NULL,
    city_code          VARCHAR(20) NOT NULL,
    city               VARCHAR(100) NOT NULL,
    street             VARCHAR(255) NOT NULL,
    number             VARCHAR(20) NOT NULL,
    price              DECIMAL(10, 2) NOT NULL,
    payment            public.payment_enum,
    description        TEXT,
    category           public.category_enum,
    number_of_rooms    INT NOT NULL CHECK (number_of_rooms > 0),
    available_slots    INT,
    userID             INT,
    CONSTRAINT fk_accommodation_user FOREIGN KEY (userID) REFERENCES "user" (userID) ON UPDATE CASCADE ON DELETE CASCADE
);

-- create amenity
CREATE TABLE amenity (
    amenityID SERIAL PRIMARY KEY,
    Name      VARCHAR(100) NOT NULL
);


-- Create Connection between Accommodation und Amenities 
CREATE TABLE accommodation_amenities (
    accommodation_amenitiesID SERIAL PRIMARY KEY,
    accommodationID           INT,
    amenityID                 INT,
    CONSTRAINT fk_accommodation_amenities_accommodationID FOREIGN KEY (accommodationID) REFERENCES accommodation (accommodationID),
    CONSTRAINT fk_accommodation_amenities_amenityID FOREIGN KEY (amenityID) REFERENCES amenity (amenityID)
);

CREATE INDEX idx_accommodationID ON accommodation_amenities (accommodationID);
CREATE INDEX idx_amenityID ON accommodation_amenities (amenityID);

-- create booking
CREATE TABLE booking (
    bookingID SERIAL PRIMARY KEY,
    guestID INT NULL,
    hostID INT NULL,
    accommodationID INT NULL,
    checkInDate DATE NULL,
    checkOutDate DATE NULL,
    people_count INT NOT NULL,
    room_count INT NOT NULL,
    interested BOOLEAN DEFAULT FALSE,
    accepted BOOLEAN DEFAULT FALSE,
    CONSTRAINT fk_guest FOREIGN KEY (guestID) REFERENCES "user" (userID),
    CONSTRAINT fk_host FOREIGN KEY (hostID) REFERENCES "user" (userID),
    CONSTRAINT fk_accommodation FOREIGN KEY (accommodationID) REFERENCES accommodation (accommodationID)
);
