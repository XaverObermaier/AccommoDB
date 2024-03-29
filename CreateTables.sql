-- Active: 1711727273971@@dpg-co3e3q821fec73900qf0-a.singapore-postgres.render.com@5432@remote_pg_db_j36o@public

CREATE TYPE public.gender_enum AS ENUM ('MALE', 'FEMALE', 'OTHER');

CREATE TABLE "public"."user" (
    userID           SERIAL PRIMARY KEY,
    username         VARCHAR(255) NOT NULL,
    password         VARCHAR(255) NOT NULL,
    firstname        VARCHAR(255) NOT NULL,
    lastname         VARCHAR(255) NOT NULL,
    gender           public.gender_enum, -- Hier "public." verwenden
    birthday         DATE,
    description      TEXT,
    email            VARCHAR(255) NOT NULL,
    telephone        VARCHAR(20),
    role             VARCHAR(50) DEFAULT 'USER'
);
