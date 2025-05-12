# 🍗🍔🍟 **Burger King Nutrition Analysis** 🍗🍔🍟

![Image](https://github.com/user-attachments/assets/ce7f287d-5d6d-4616-81ac-4f22e91a9a81)


# **📌 Introduction**  
Fast food has become an integral part of the global food culture, with chains like Burger King leading the charge in offering quick, convenient, and flavorful meals. However, as society becomes more health-conscious, consumers are increasingly seeking ways to make better dietary choices. With growing awareness of the importance of nutrition and its long-term impact on health, people are turning to data-driven insights to make more informed decisions about the food they consume. This shift in consumer behavior is reshaping the food industry, especially among fast food chains like Burger King.

Burger King, a well-established player in the fast-food industry, has witnessed this shift in consumer preferences as more people demand transparency and healthier options on the menu. With the increasing availability of nutritional information, consumers are now empowered to make choices that not only satisfy their taste buds but also align with their health goals. In response, the demand for healthier fast-food options has surged, pushing brands like Burger King to reconsider their menus and offer more balanced meals that cater to health-conscious consumers.

This project aims to analyze the nutritional value of Burger King’s menu items to uncover key trends, identify the most and least nutritious items, and provide consumers with valuable insights to help them make more balanced dietary choices. By evaluating various nutritional metrics such as calories, fat content, protein, carbohydrates, sodium, and other health-related factors, this analysis seeks to guide consumers towards better food choices while still enjoying their favorite fast-food options.

With increasing emphasis on health and wellness, understanding the nutritional composition of fast food items can help consumers make informed decisions that balance taste and nutrition. By providing data-driven insights, this project not only supports consumers in making healthier choices but also encourages fast food chains to align their offerings with the growing demand for healthier menu options, ultimately contributing to a more health-conscious society.


# **🎯 Purpose of the Project**  
The goal of this project is to perform a **comprehensive data analysis** of **Burger King’s menu** using **SQL** to extract meaningful insights. 

Specifically, the project aims to:  

✅ Identify **high-calorie, high-fat, and high-sugar** menu items.  
✅ Highlight the **most nutritious options** by considering protein, fiber, and fat content.  
✅ Determine **balanced meal choices** based on macronutrient distribution.  
✅ Analyze **fat-to-calorie and salt-to-fat ratios** to assess overall health impact.  
✅ Provide insights for consumers, fitness enthusiasts, and health professionals.  



# **🔍 Key Problem Statement**  
Fast-food chains offer a wide range of menu items, but **customers often struggle** to differentiate between **healthy and unhealthy choices**. 
The key challenges this project aims to address are:  

❌ **Which menu items contribute the most to excessive calorie intake?**  
❌ **What are the best high-protein and fiber-rich options for health-conscious individuals?**  
❌ **How can consumers find a balanced meal with an optimal ratio of protein, carbs, and fat?**  
❌ **What are the least healthy menu items based on calories, fat, and sodium levels?**  

By leveraging **SQL queries**, this project seeks to answer these critical questions, enabling better food choices.  


# 💻 **SQL Code**

## ❓ Calculate the percentage of items in each category


## ⌨️ **SQL Code :**

    SELECT 
    category, 
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM burger_king_menu),2) AS percentage
    FROM burger_king_menu
    GROUP BY category
    ORDER BY percentage DESC;


## 📊 **Insights :**

- **Beverages Drive the Highest Sales** – The **Beverage** category accounts for the largest share (30.52%), indicating that drinks contribute significantly to overall revenue. This could suggest a high demand for soft drinks, coffee, or other beverages, possibly driven by combo meal purchases.  

- **Breakfast and Burgers Are Key Menu Items** – **Breakfast (14.94%)** and **Burgers (13.64%)** are among the top-selling categories, showing that these are core offerings customers frequently purchase. Breakfast's strong performance may indicate a loyal morning customer base.  

- **Low-Performing Categories Offer Growth Potential** – Categories like **Desserts (5.84%)** and **Additional Options (6.49%)** have the lowest shares. This suggests an opportunity to boost their sales through promotions, bundling strategies, or product innovation.


# ❓ Most Nutritious Item per Category (Highest Protein)


## ⌨️ **SQL Code :**

    SELECT X.*
    FROM (
        SELECT *, row_number() OVER(PARTITION BY category ORDER BY 'Protein (g)') AS rn
        FROM burger_king_menu
    ) X
    WHERE X.rn = 1;


## 📊 **Insights :**

- **Burgers and Chicken Items Are High in Protein** – The Triple WHOPPER Sandwich with Cheese (71g) and Chicken Nuggets (20pc) (45g) provide significant protein content, making them ideal for protein-conscious customers. These items can be marketed toward customers looking for high-protein meals.

- **Breakfast Offers a Protein-Rich Option** – The EGG-NORMOUS BURRITO (34g) is a strong source of protein in the breakfast category, appealing to customers looking for a filling morning meal. This suggests an opportunity to emphasize protein in breakfast promotions.

- **Dairy-Based Beverages and Desserts Also Contribute to Protein Intake** – Items like Fat-Free Milk (9g) and OREO Cookie Chocolate Shake (14g) show that beverages and desserts can also be sources of protein, which could be leveraged in marketing to highlight nutritional benefits.


# ❓ Top 10 items with the highest calories


## ⌨️ **SQL Code :**

    SELECT item FROM burger_king_menu
    ORDER BY calories DESC
    LIMIT 10;


## 📊 **Insights :**

-- **Burgers Dominate the High-Calorie List** – Out of the top 10 highest-calorie items, six belong to the Burgers category, with the RODEO King™ Sandwich (1300 calories) being the most calorific item. This highlights that burger-based items contribute significantly to calorie intake.

-- **Chicken Nuggets Are Also High in Calories** – Both Spicy Chicken Nuggets (1050 calories) and Regular Chicken Nuggets (970 calories) (20pc servings) are among the top 10 highest-calorie items. This suggests that large servings of fried chicken products significantly impact calorie consumption.

-- **Breakfast and Sides Can Be Calorie-Heavy** – The BK Ultimate Breakfast Platter (970 calories) is the highest-calorie breakfast item, showing that some morning meals can be as calorie-dense as burgers. It might be worth highlighting lower-calorie breakfast options for customers seeking lighter choices.


# ❓ Top 10 items with the highest fat content


## ⌨️ **SQL Code :**

    SELECT * FROM burger_king_menu
    ORDER BY 'Fat (g)' DESC
    LIMIT 10;


## 📊 **Insights :**

- **Burgers Are the Primary Source of High Fat Content** – Out of the top 10 highest-fat items, six belong to the Burgers category, with the RODEO King™ Sandwich (83g fat) leading the list. These burgers contain high levels of saturated and trans fats, which can contribute to health concerns if consumed frequently.

- **Chicken Nuggets Contain Significant Fat** – Both the Spicy Chicken Nuggets (74g fat, 20pc) and Regular Chicken Nuggets (62g fat, 20pc) rank among the highest in fat content. While chicken is often considered a lean protein, the deep-frying process substantially increases fat content.

- **Breakfast Items Can Be High in Fat** – The Double CROISSAN'WICH with Sausage (54g fat) appears in the top 10, showing that some breakfast choices can contain as much fat as large burgers. Customers looking for lower-fat breakfast options might need to consider alternatives.



# ❓ Top 10 Highest Trans Fat Items


## ⌨️ **SQL Code :**

    SELECT * 
    FROM burger_king_menu
    ORDER BY 'Trans Fat (g)' DESC
    LIMIT 10;


## 📊 **Insights :**

- **Burgers and Breakfast Items Dominate High Trans Fat Content** – The Triple WHOPPER with Cheese (4.5g trans fat) has the highest trans fat content, followed by breakfast items like the BK Ultimate Breakfast Platter (1.5g) and EGG-NORMOUS BURRITO (1.5g). This indicates that both heavy burgers and large breakfast options contribute significantly to unhealthy trans fat intake.

- **High Trans Fat in Signature Burgers** – Six of the ten items are burgers, with most containing 1g or more of trans fat. These include the RODEO King, BACON King, and Single Stacker King, all of which have over 1000 calories and high saturated fat as well.

- **Breakfast Options Are Not Always a Healthier Alternative** – Many people perceive breakfast items as a lighter meal, but four breakfast items appear in the top 10, including the Croissan'wich with Sausage, Egg & Cheese (1g trans fat). Some of these have higher cholesterol levels than burgers, making them an equally risky option for heart health.


# ❓ Top 10 Highest Dietary Fiber Items

## ⌨️ **SQL Code :**

    SELECT *
    FROM burger_king_menu
    ORDER BY 'Dietary Fiber (g)' DESC
    LIMIT 10;



## 📊 **Insights :**

- **Crispy Chicken Sandwiches Have the Most Fiber**

   - The Bacon & Swiss Royal Crispy Chicken Sandwich (9g fiber), Spicy Royal Crispy Chicken Sandwich (9g fiber), and Classic Royal Crispy Chicken Sandwich (9g fiber) lead the list.

   - These options provide both protein and fiber, making them a relatively balanced choice compared to other high-calorie menu items.

- **Sides and Breakfast Items Also Provide Fiber**

   - Large Onion Rings (7g fiber) and Hash Browns (6g fiber - large, 5g fiber - medium) rank among the highest fiber items.

   - While these offer fiber, they also come with high fat and sodium, making them less ideal for a healthy diet.

- **High Fiber Doesn’t Always Mean Healthy**

   - Many of these items, like the Spicy Chicken Nuggets (9g fiber, 74g fat) and the Double Stacker King (6g fiber, 32g fat), are still high in fat and calories.

   - It’s essential to balance fiber intake with lower-fat options for a healthier meal choice.


# ❓ Healthy Index Score (Custom Formula)

## ⌨️ **SQL Code :**

    SELECT item, 
           (protein_g * 2 + dietary_fiber_g * 1.5 - fat_g - sugars_g) AS health_score 
    FROM burger_king_menu
    ORDER BY health_score DESC
    LIMIT 10;


## 📊 **Insights :**

- **Salads Rank Higher Than Most Burgers**

   - The Chicken Club Salad (50.0) and Chicken Garden Salad (43.0) score well despite being lower in calories and fat, making them relatively healthier options.

   - This indicates that reducing fat and sodium plays a key role in a higher health score.

- **Some Burgers Score Surprisingly High**

   - The Triple WHOPPER with Cheese (52.0) and Single Quarter Pound King (51.5) top the list.

   - This suggests that protein content is a major factor in the health score, despite their high fat and calorie levels.

- **Chicken Items Score in the Mid-Range**

   - The Bacon & Swiss Royal Crispy Chicken Sandwich (38.5) and 20pc Chicken Nuggets (35.5) are in the lower half of the rankings.

   - While chicken is often considered a "healthier" choice, fried versions bring down their health score due to high fat and sodium content.




# ❓ Finding the Most Balanced Meal (Equal Fat, Protein, and Carbs)

## ⌨️ **SQL Code :**

    WITH Balanced AS (
      SELECT 
        item,
        category,
        fat_g,
        protein_g,
        total_carb_g,
        ABS(fat_g - protein_g) + 
        ABS(protein_g - total_carb_g) + 
        ABS(total_carb_g - fat_g) AS balance_score
      FROM burger_king_menu
    ),
    Ranked AS (
      SELECT *,
             ROW_NUMBER() OVER (PARTITION BY category ORDER BY balance_score ASC) AS rank
      FROM Balanced
    )
    SELECT item, category, fat_g, protein_g, total_carb_g, balance_score
    FROM Ranked
    WHERE rank <= 3
    ORDER BY category, balance_score;



## 📊 **Insights :**

- It looks like your "Most Balanced Meal" calculation is being dominated by beverages, which have zero protein, fat, and carbs—resulting in a balance score of 0.0.


# ❓ High-Protein, Low-Carb Options

## ⌨️ **SQL Code :**


     WITH SortedData AS (
     SELECT item, category, protein_g, total_carb_g,
            PERCENT_RANK() OVER (ORDER BY protein_g DESC) AS percentile_rank
     FROM burger_king_menu
     )
     SELECT item, category, protein_g, total_carb_g
     FROM SortedData
     WHERE percentile_rank >= 0.9
     ORDER BY protein_g DESC, total_carb_g ASC;



## 📊 **Insights :**

- Garden Side Salad (9g protein, 3g carbs) → A great low-carb, high-protein choice.

- American Cheese (2g protein, 1g carb) → Good as a topping for added protein.

- Crispy Taco (5g protein, 19g carbs) → The carb count is a bit high.

- Buttery Garlic Croutons (1g protein, 9g carbs) → Mostly carbs, low protein.
  


# ❓ Salt-to-Fat Ratio

## ⌨️ **SQL Code :**

    SELECT item, sodium_mg, fat_g, (sodium_mg / NULLIF(fat_g, 0)) AS salt_fat_ratio
    FROM burger_king_menu
    ORDER BY salt_fat_ratio DESC
    LIMIT 10;


## 📊 **Insights :**

- Ham, Egg, & Cheese Biscuit (70.0) – The highest sodium-to-fat ratio; might be too salty for some.

- Buttery Garlic Croutons (60.0) – Small but salty; mostly carbs, low fat.

- Chicken Fries (60.0) – High sodium snack with moderate fat.

- IMPOSSIBLE Whopper (56.0) – Even the plant-based option has a high sodium-to-fat ratio.

- American Cheese (51.4) – Small but still quite salty.


# ❓ Fat-to-Calorie Ratio


## ⌨️ **SQL Code :**

    SELECT item, fat_calories, calories, (fat_calories / NULLIF(calories, 0)) AS fat_cal_ratio
    FROM burger_king_menu
    ORDER BY fat_cal_ratio DESC
    LIMIT 10;



## 📊 **Insights :**

- Mayonnaise (Packet) – 1.00 → All calories come from fat.

- Ken's Golden Italian Dressing – 0.95 → Nearly 95% of calories from fat!

- Zesty Onion Ring Dipping Sauce – 0.93 → More fat than expected.

- American Cheese (0.75) → High in fat relative to calories, but still lower than sauces.

- Double CROISSAN'WICH with Sausage (0.67) → A major source of fat in a breakfast item.

- Spicy Chicken Nuggets (0.64) → Despite being protein-heavy, they still pack a lot of fat.

    
# ❓ Least Healthy Items (Highest Calories & Fat)

## ⌨️ **SQL Code :**

    SELECT item, calories, fat_g 
    FROM burger_king_menu
    ORDER BY calories DESC, fat_g DESC
    LIMIT 10;


## 📊 **Insights :**


- RODEO King™ Sandwich – 1,300 kcal, 83g fat

- Triple WHOPPER w/ Cheese – 1,220 kcal, 82g fat

- BACON King™ Sandwich – 1,200 kcal, 81g fat

- Spicy Chicken Nuggets (20 pc) – 1,050 kcal, 74g fat → Despite being “chicken,” they rank among the highest in fat.

- BK Ultimate Breakfast Platter – 970 kcal, 48g fat → Even breakfast items aren’t safe from high-calorie counts.

- Single Stacker King (1,130 kcal, 73g fat) → A “single” burger but still among the highest in fat.



# ❓ Lowest Sodium (Healthier Choices for Heart Health)

## ⌨️ **SQL Code :**

    WITH RankedItems AS (
    SELECT item, sodium_mg, category,
           ROW_NUMBER() OVER (PARTITION BY category ORDER BY sodium_mg ASC) AS rank
    FROM burger_king_menu
    )
    SELECT item, sodium_mg, category
    FROM RankedItems
    WHERE rank <= 3
    ORDER BY category, sodium_mg ASC;



## 📊 **Insights :**


- BK Café Coffee (12, 20 fl oz) – Classic black coffee, zero sodium.

- Unsweetened Tea (20, 29, 40 fl oz) – Good alternative to sugary drinks.

- Simply Orange Juice (11.5 oz) – Natural, no added sodium.

- Sweet Tea (20, 29, 40 fl oz) – While sodium-free, still high in sugar.

- No solid food items in this list.




# 🏆 **Final Recommendation**  

-  Promote **high-fiber and high-protein meals** for customers focused on nutrition.  

- Introduce **healthier meal combos**  that balance protein, carbs, and fat.  
  
- rovide **sodium-conscious menu labeling**  to help customers make heart-healthy choices.  
  
- timize the **menu pricing & marketing strategy**  based on the healthiest and most preferred items.  

- Enhance **digital menu boards & ordering systems**  with **real-time nutritional insights**.  


# 🎯 **Conclusion** 

Through an in-depth exploration of nutritional data, this project has provided valuable insights into the healthier and unhealthier menu options available. The analysis considered various health-related factors, including dietary fiber, protein content, sodium levels, fat-to-calorie ratios, and overall health scores calculated using a custom formula.One of the key findings was the identification of high dietary fiber items , which play a crucial role in promoting digestive health and maintaining a balanced diet. These items can be strategically marketed as nutritious alternatives for health-conscious customers.

Furthermore, the health score rankings  revealed the best and worst items based on a comprehensive evaluation of their nutritional profiles. This scoring system allowed for a clear comparison of menu items, helping customers make more informed decisions.A major aspect of this study was the balanced meal analysis ⚖, which aimed to find menu items with an optimal ratio of protein, fat, and carbohydrates. Interestingly, certain beverages, such as unsweetened tea and black coffee, emerged as completely free of calories, fat, and carbohydrates, making them excellent choices for those looking to maintain a zero-calorie intake from beverages.In addition to identifying balanced meal options, the study also focused on high-protein, low-carb choices. These findings are particularly beneficial for individuals following low-carb diets or those looking to increase their protein intake for muscle maintenance and overall satiety.

Another crucial aspect was the sodium content analysis ⚡, which highlighted heart-healthy choices by ranking items with the lowest sodium levels. Since excessive sodium intake is linked to high blood pressure and cardiovascular diseases, identifying these lower-sodium menu items can help customers make healthier decisions while managing their sodium consumption.





