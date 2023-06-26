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

CREATE TABLE IF NOT EXISTS recipes
(
    id         INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title      VARCHAR(255) NOT NULL,
    slug       VARCHAR(255) NOT NULL,
    content    TEXT,
    duration   INTEGER,
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