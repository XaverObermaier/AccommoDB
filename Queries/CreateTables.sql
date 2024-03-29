-- Active: 1711727273971@@dpg-co3e3q821fec73900qf0-a.singapore-postgres.render.com@5432@remote_pg_db_j36o@public

-- user table 
DROP TABLE IF EXISTS "user";
CREATE TYPE public.gender_enum AS ENUM ('MALE', 'FEMALE', 'OTHER');

CREATE TABLE "public"."user" (
    userID           SERIAL PRIMARY KEY,
    username         VARCHAR(255) NOT NULL,
    password         VARCHAR(255) NOT NULL,
    firstname        VARCHAR(255) NOT NULL,
    lastname         VARCHAR(255) NOT NULL,
    gender           public.gender_enum, 
    birthday         DATE,
    description      TEXT,
    email            VARCHAR(255) NOT NULL,
    telephone        VARCHAR(20),
    role             VARCHAR(50) DEFAULT 'USER'
);

-- accommodatio table 
DROP TABLE IF EXISTS accommodation;
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


