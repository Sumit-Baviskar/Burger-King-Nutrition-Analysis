
Create Database Project;

Use Project;

CREATE TABLE burger_king_menu (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    calories INT NOT NULL,
    fat_calories INT NOT NULL,
    fat_g DECIMAL(5,2) NOT NULL,
    saturated_fat_g DECIMAL(5,2) NOT NULL,
    trans_fat_g DECIMAL(5,2) NOT NULL,
    cholesterol_mg INT NOT NULL,
    sodium_mg INT NOT NULL,
    total_carb_g DECIMAL(5,2) NOT NULL,
    dietary_fiber_g DECIMAL(5,2) NOT NULL,
    sugars_g DECIMAL(5,2) NOT NULL,
    protein_g DECIMAL(5,2) NOT NULL);



SELECT * FROM burger_king_menu;


Describe burger_king_menu;

-- Calculate the percentage of items in each category

SELECT 
    category, 
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM burger_king_menu),2) AS percentage
FROM burger_king_menu
GROUP BY category
ORDER BY percentage DESC;


-- Most Nutritious Item per Category (Highest Protein)

SELECT X.*
FROM (
    SELECT *, dense_rank() OVER(PARTITION BY category ORDER BY 'Protein (g)') AS rn
    FROM burger_king_menu
) X
WHERE X.rn = 1;


-- Top 10 items with the highest calories

SELECT item FROM burger_king_menu
ORDER BY calories DESC
LIMIT 10;



-- Top 10 items with the highest fat content

SELECT * FROM burger_king_menu
ORDER BY 'Fat (g)' DESC
LIMIT 10;


-- Top 10 Highest Trans Fat Items

SELECT * 
FROM burger_king_menu
ORDER BY 'Trans Fat (g)' DESC
LIMIT 10;


--  Top 10 Highest Dietary Fiber Items

SELECT *
FROM burger_king_menu
ORDER BY 'Dietary Fiber (g)' DESC
LIMIT 10;



-- Healthy Index Score (Custom Formula)
SELECT item, 
       (protein_g * 2 + dietary_fiber_g * 1.5 - fat_g - sugars_g) AS health_score 
FROM burger_king_menu
ORDER BY health_score DESC
LIMIT 10;



-- Finding the Most Balanced Meal (Equal Fat, Protein, and Carbs)

SELECT item, protein_g, fat_g, total_carb_g, 
       ABS(protein_g - fat_g) + ABS(protein_g - total_carb_g) AS balance_score
FROM burger_king_menu
ORDER BY balance_score ASC
LIMIT 10;


-- High-Protein, Low-Carb Options

SELECT item, protein_g, total_carb_g 
FROM burger_king_menu
WHERE total_carb_g < 20  
ORDER BY protein_g DESC
LIMIT 10;


-- Salt-to-Fat Ratio

SELECT item, sodium_mg, fat_g, (sodium_mg / NULLIF(fat_g, 0)) AS salt_fat_ratio
FROM burger_king_menu
ORDER BY salt_fat_ratio DESC
LIMIT 10;


-- Fat-to-Calorie Ratio

SELECT item, fat_calories, calories, (fat_calories / NULLIF(calories, 0)) AS fat_cal_ratio
FROM burger_king_menu
ORDER BY fat_cal_ratio DESC
LIMIT 10;


    
-- Least Healthy Items (Highest Calories & Fat)

SELECT item, calories, fat_g 
FROM burger_king_menu
ORDER BY calories DESC, fat_g DESC
LIMIT 10;


-- Lowest Sodium (Healthier Choices for Heart Health)

SELECT item, sodium_mg 
FROM burger_king_menu
ORDER BY sodium_mg ASC
LIMIT 10;

