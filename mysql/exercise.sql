DROP TABLE IF EXISTS ingredients_recipes;
DROP TABLE IF EXISTS categories_recipes;
DROP TABLE IF EXISTS recipes;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS ingredients;
DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    id       INTEGER PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE,
    email    VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE recipes
(
    id       INTEGER PRIMARY KEY AUTO_INCREMENT,
    title    VARCHAR(100)       NOT NULL,
    slug     VARCHAR(100)       NOT NULL,
    date     DATETIME DEFAULT NOW(),
    duration INTEGER  DEFAULT 0 NOT NULL,
    user_id  INTEGER            NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE categories
(
    id    INTEGER PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL
);

CREATE TABLE categories_recipes
(
    recipe_id   INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    FOREIGN KEY (recipe_id) REFERENCES recipes (id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE CASCADE,
    PRIMARY KEY (recipe_id, category_id),
    UNIQUE KEY (recipe_id, category_id)
);

CREATE TABLE ingredients
(
    id   INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE ingredients_recipes
(
    recipe_id     INTEGER NOT NULL,
    ingredient_id INTEGER NOT NULL,
    FOREIGN KEY (recipe_id) REFERENCES recipes (id) ON DELETE CASCADE,
    FOREIGN KEY (ingredient_id) REFERENCES ingredients (id) ON DELETE CASCADE,
    PRIMARY KEY (recipe_id, ingredient_id),
    UNIQUE KEY (recipe_id, ingredient_id),
    quantity      INTEGER DEFAULT 1,
    unit          VARCHAR(20)
);

SHOW TABLES;

INSERT INTO users (username, email)
VALUES ('admin', 'admin@admin.fr');

INSERT INTO categories (title)
VALUES ('Plat'),
       ('Dessert'),
       ('Gateau');

INSERT INTO recipes (title, slug, duration, user_id)
VALUES ('Crème anglaise', 'creme-anglaise', 10, 1),
       ('Salade de fruit', 'salade-de-fruit', 10, 1),
       ('Soupe', 'soupe', 20, 1),
       ('Mousse au chocolat', 'mousse-au-chocolat', 20, 1);

SELECT *
FROM recipes;

INSERT INTO categories_recipes (recipe_id, category_id)
VALUES (1, 2),
       (2, 2),
       (3, 1),
       (4, 2);

SELECT *
FROM recipes r
         JOIN categories_recipes cr ON r.id = cr.recipe_id
         JOIN categories c on c.id = cr.category_id;

SELECT r.title AS title, c.title AS categorie
FROM recipes r
         JOIN categories_recipes cr ON r.id = cr.recipe_id
         JOIN categories c on c.id = cr.category_id;

INSERT INTO ingredients (name)
VALUES ('oeuf'),
       ('farine'),
       ('sucre'),
       ('lait'),
       ('beurre'),
       ('levure');

INSERT INTO ingredients_recipes (recipe_id, ingredient_id, quantity, unit)
VALUES (4, 3, 150, 'g'),
       (4, 2, 200, 'g'),
       (4, 6, 8, 'g'),
       (4, 5, 100, 'g'),
       (4, 4, 50, 'g'),
       (4, 1, 3, NULL);

SELECT *
FROM ingredients
WHERE ingredients.name = 'oeuf';

SELECT r.title
FROM ingredients
         JOIN ingredients_recipes ir ON ingredients.id = ir.ingredient_id
         JOIN recipes r ON r.id = ir.recipe_id
WHERE ingredients.name = 'oeuf';

SELECT *
FROM recipes
         LEFT JOIN ingredients_recipes ir ON recipes.id = ir.recipe_id
WHERE ir.recipe_id IS NULL;

DELETE
FROM ingredients
WHERE id = 6;

SELECT *
FROM ingredients_recipes;

SELECT *
FROM recipes r
         JOIN ingredients_recipes ir ON ir.recipe_id = r.id;

SELECT r.title, ir.quantity, ir.unit, i.name AS ingredient
FROM recipes r
         JOIN ingredients_recipes ir ON ir.recipe_id = r.id
         JOIN ingredients i on ir.ingredient_id = i.id;

SELECT * FROM recipes;
SELECT * FROM ingredients;

UPDATE ingredients_recipes SET quantity = 4 WHERE recipe_id = 4 AND ingredient_id = 1;