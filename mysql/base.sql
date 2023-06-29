DROP TABLE IF EXISTS posts;

CREATE TABLE IF NOT EXISTS posts
(
    id        INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title     VARCHAR(255) NOT NULL,
    content   TEXT,
    createdAt DATETIME
);

ALTER TABLE posts
    ADD category VARCHAR(50);

DROP TABLE posts;

DROP TABLE IF EXISTS recipes;

SELECT *
FROM recipes;

CREATE TABLE IF NOT EXISTS recipes
(
    id         INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title      VARCHAR(255) NOT NULL,
    slug       VARCHAR(255) NOT NULL UNIQUE,
    content    TEXT,
    duration   INTEGER DEFAULT 10,
    online     BOOLEAN,
    created_at DATETIME
);

INSERT INTO recipes
(title,
 slug,
 content,
 duration,
 online,
 created_at)
VALUES ('Salade de fruit',
        'salade-de-fruit',
        'Contenu de test',
        30,
        TRUE,
        NOW());

SELECT *
FROM recipes;

INSERT INTO recipes
(title,
 slug,
 content,
 duration,
 online,
 created_at)
VALUES ('Soupe',
        'soupe',
        'Contenu de test',
        10,
        FALSE,
        NOW());

SELECT title
FROM recipes;

SELECT *
FROM recipes
WHERE duration < 20;

SELECT *
FROM recipes
WHERE slug = 'soupe';

SELECT *
FROM recipes
WHERE duration BETWEEN 0 AND 30;

SELECT *
FROM recipes
WHERE slug = 'soupe'
  AND duration < 30;

SELECT *
FROM recipes
WHERE slug = 'soupe'
   OR duration > 20;

SELECT *
FROM recipes
WHERE slug IN ('soupe');

SELECT *
FROM recipes
WHERE (slug = 'soupe' OR duration > 20)
  AND online = true;

SELECT *
FROM recipes
WHERE slug LIKE 'salade%';

INSERT INTO recipes
(title,
 slug,
 content,
 duration,
 online,
 created_at)
VALUES ('Quiche',
        'quiche',
        'Contenu de test',
        40,
        FALSE,
        NOW()),
       ('Lasagnes',
        'lasagne',
        'Contenu de test',
        60,
        TRUE,
        NOW());

INSERT INTO recipes
(title,
 slug,
 content,
 duration,
 online,
 created_at)
VALUES ('Quiche',
        'quiche',
        'Contenu de test',
        40,
        FALSE,
        NOW()),
       ('Lasagnes',
        'lasagne',
        'Contenu de test',
        60,
        TRUE,
        NOW());

DELETE
FROM recipes
WHERE title = 'Salade de fruit';

SELECT *
FROM recipes;

INSERT INTO recipes
(title,
 slug,
 content,
 duration,
 online,
 created_at)
VALUES ('Salade de fruit',
        'salade-de-fruit',
        'Contenu de test',
        30,
        TRUE,
        NOW());

UPDATE recipes
SET title = 'Soupe de légumes'
WHERE title = 'Soupe';

UPDATE recipes
SET title = 'Soupe de fleurs',
    slug  = 'soupe-de-fleurs'
WHERE id = 2;

DELETE
FROM recipes
WHERE id IN (5, 6);

CREATE UNIQUE INDEX idx_slug ON recipes (slug);

DROP INDEX idx_slug ON recipes;

EXPLAIN
SELECT *
FROM recipes
WHERE slug = 'quiche';

SELECT *
FROM recipes;

INSERT INTO recipes
(title,
 slug,
 duration,
 online,
 created_at)
VALUES ('Salade de fruit 2',
        'salade-de-fruit-2',
        30,
        TRUE,
        NOW());

SELECT *
FROM recipes
WHERE content IS NOT NULL;

SELECT *
FROM recipes
WHERE content IS NULL;

UPDATE recipes
SET content = NULL
WHERE slug = 'salade-de-fruit';

INSERT INTO recipes
(title,
 slug,
 content,
 online,
 created_at)
VALUES ('Salade de légumes',
        'salade-de-legumes',
        'Contenu de test',
        TRUE,
        NOW());

SELECT *
FROM recipes;

DROP TABLE IF EXISTS categories;

CREATE TABLE IF NOT EXISTS categories
(
    id          INTEGER PRIMARY KEY AUTO_INCREMENT,
    title       VARCHAR(150) NOT NULL,
    description TEXT
);

INSERT INTO categories (title)
VALUES ('Plat'),
       ('Dessert');

SELECT *
FROM categories;

DROP TABLE IF EXISTS recipes;

CREATE TABLE IF NOT EXISTS recipes
(
    id          INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title       VARCHAR(255) NOT NULL,
    slug        VARCHAR(255) NOT NULL UNIQUE,
    content     TEXT,
    category_id INTEGER
);

INSERT INTO recipes (title, slug, category_id)
VALUES ('Crème anglaise', 'creme-anglaise', 2),
       ('Salade de fruit', 'salade-de-fruit', 3),
       ('Soupe', 'soupe', 1);

SELECT *
FROM recipes;

DROP TABLE IF EXISTS recipes;

CREATE TABLE IF NOT EXISTS recipes
(
    id          INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title       VARCHAR(255) NOT NULL,
    slug        VARCHAR(255) NOT NULL UNIQUE,
    content     TEXT,
    category_id INTEGER,
    FOREIGN KEY (category_id) REFERENCES categories (id)
);

INSERT INTO recipes (title, slug, category_id)
VALUES ('Crème anglaise', 'creme-anglaise', 2),
       ('Salade de fruit', 'salade-de-fruit', 2),
       ('Soupe', 'soupe', 1);

SHOW TABLES;

SELECT *
FROM recipes
         JOIN categories ON recipes.category_id = categories.id;

SELECT *
FROM recipes r
         JOIN categories c ON r.category_id = c.id;

SELECT recipes.id, recipes.title, categories.title
FROM recipes
         JOIN categories ON recipes.category_id = categories.id;

SELECT r.id, r.title, c.title
FROM recipes r
         JOIN categories c ON r.category_id = c.id;

SELECT r.id AS id, r.title AS title, c.title AS category
FROM recipes r
         JOIN categories c ON r.category_id = c.id;

DROP TABLE IF EXISTS recipes;

CREATE TABLE IF NOT EXISTS recipes
(
    id          INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title       VARCHAR(255) NOT NULL,
    slug        VARCHAR(255) NOT NULL UNIQUE,
    content     TEXT,
    category_id INTEGER,
    FOREIGN KEY (category_id) REFERENCES categories (id)
);

INSERT INTO recipes (title, slug, category_id)
VALUES ('Crème anglaise', 'creme-anglaise', 2),
       ('Salade de fruit', 'salade-de-fruit', 2),
       ('Soupe', 'soupe', NULL);

SELECT r.id AS id, r.title AS title, c.title AS category
FROM recipes r
         JOIN categories c ON r.category_id = c.id;

SELECT r.id AS id, r.title AS title, c.title AS category
FROM recipes r
         LEFT JOIN categories c ON r.category_id = c.id;

SELECT r.id AS id, r.title AS title, c.title AS category
FROM recipes r
         INNER JOIN categories c ON r.category_id = c.id;

SELECT *
FROM categories;

DELETE
FROM categories
WHERE id = 2;

SELECT *
FROM recipes;

DROP TABLE IF EXISTS recipes;

CREATE TABLE IF NOT EXISTS recipes
(
    id          INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title       VARCHAR(255) NOT NULL,
    slug        VARCHAR(255) NOT NULL UNIQUE,
    content     TEXT,
    category_id INTEGER,
    FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE CASCADE
);

INSERT INTO recipes (title, slug, category_id)
VALUES ('Crème anglaise', 'creme-anglaise', 2),
       ('Salade de fruit', 'salade-de-fruit', 2),
       ('Soupe', 'soupe', NULL);

DELETE
FROM categories
WHERE id = 2;

SELECT *
FROM recipes;

INSERT INTO categories (title)
VALUES ('Dessert');

SELECT *
FROM categories;

INSERT INTO recipes (title, slug, category_id)
VALUES ('Crème anglaise', 'creme-anglaise', 3),
       ('Salade de fruit', 'salade-de-fruit', 3);

UPDATE recipes
SET category_id = 1
WHERE slug = 'soupe';

SELECT *
FROM recipes;

SELECT r.id AS id, r.title AS title, c.title AS category
FROM recipes r
         INNER JOIN categories c ON r.category_id = c.id
WHERE c.title = 'Dessert';

DROP TABLE IF EXISTS recipes;
DROP TABLE IF EXISTS categories;

SHOW TABLES;
