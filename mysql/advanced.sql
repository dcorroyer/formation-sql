SELECT i.name
FROM ingredients i
LEFT JOIN ingredients_recipes ir ON ir.ingredient_id = i.id
GROUP BY i.name;

SELECT i.name, COUNT(ir.recipe_id) as count
FROM ingredients i
         LEFT JOIN ingredients_recipes ir ON ir.ingredient_id = i.id
GROUP BY i.name;

SELECT i.name, COUNT(ir.recipe_id) as count
FROM ingredients i
         LEFT JOIN ingredients_recipes ir ON ir.ingredient_id = i.id
         LEFT JOIN recipes r ON ir.recipe_id = r.id
GROUP BY i.name, r.duration;

SELECT i.name, COUNT(ir.recipe_id) as count
FROM ingredients i
         LEFT JOIN ingredients_recipes ir ON ir.ingredient_id = i.id
         LEFT JOIN recipes r ON ir.recipe_id = r.id
GROUP BY i.name, r.duration
ORDER BY count DESC
LIMIT 10;
#OFFSET 4;

