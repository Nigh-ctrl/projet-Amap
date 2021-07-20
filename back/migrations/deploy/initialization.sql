-- Deploy amap:initialization to pg

BEGIN;

CREATE TABLE admin(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email VARCHAR(50) NOT NULL UNIQUE,
    mdp VARCHAR(100) NOT NULL
);

CREATE TABLE farmer(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "location" VARCHAR(100) NOT NULL,
    biography TEXT NOT NULL,
    basket TEXT,
    admin_id INT NOT NULL REFERENCES admin(id)
);

CREATE TABLE category(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    label VARCHAR(50) NOT NULL
);

CREATE TABLE article(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    content TEXT NOT NULL,
    admin_id INT NOT NULL REFERENCES admin(id),
    category_id INT NOT NULL REFERENCES category(id)
);

CREATE TABLE product(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    label VARCHAR(50) NOT NULL
);

CREATE TABLE season(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    label VARCHAR(50) NOT NULL
);

CREATE TABLE recipe(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    ingredients TEXT NOT NULL,
    "description" TEXT NOT NULL,
    admin_id INT NOT NULL REFERENCES admin(id),
    season_id INT NOT NULL REFERENCES season(id)
);

CREATE TABLE farmer_to_product(
    farmer_id INT NOT NULL REFERENCES farmer(id),
    product_id INT NOT NULL REFERENCES product(id)
);

COMMIT;
