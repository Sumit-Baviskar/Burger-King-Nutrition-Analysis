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

![Image](https://github.com/user-attachments/assets/6fb0a72b-2518-464d-97c9-d16ad55d0026)

## 📊 **Insights :**

- **Beverages** make up the **largest portion of the menu**, comprising over 30% of items, indicating a strong focus on drink options.

- **Breakfast items** are the second most numerous category at **14.94%**, showing that Burger King has a significant range of breakfast options.

- **Burgers and Chicken & More** together make up a combined 25.68%, reflecting Burger King's traditional focus on burgers and chicken products.

- **Salads & Sides** are a **smaller but still relevant part of the menu**, making up nearly 10% of the items.

- **BK Café and Additional Options** represent minor sections of the menu, with Desserts at the lowest percentage, making up just 5.84% of the menu items.


## ❓ Most Nutritious Item per Category (Highest Protein)


## ⌨️ **SQL Code :**

    SELECT X.*
    FROM (
        SELECT *, row_number() OVER(PARTITION BY category ORDER BY 'Protein (g)') AS rn
        FROM burger_king_menu
    ) X
    WHERE X.rn = 1;

![Image](https://github.com/user-attachments/assets/023c3508-6497-47ee-9353-4aa992f1add1)

## 📊 **Insights :**

- **Burgers have the highest protein item**: the Triple Whopper Sandwich with Cheese contains a significant 71 grams of protein, making it the most protein-rich item on the menu.

- **Chicken & More** also offers high protein, with **Chicken Nuggets (20pc)** providing 45 grams of protein, making it a strong contender in the nutritious category.

- **Breakfast** is represented by the **Egg-normous Burrito**, which packs 34 grams of protein, making it a good option for a protein-filled start to the day.

- **Salads & Sides**: the **Chicken Club Salad (without dressing)** is also a top contestant, with 45 grams of protein.

- **BK Café** and **Beverages** provide relatively lower protein items, such as **BK Café** Iced **Mocha Coffee** (3 g) and **Fat-Free Milk** (9 g).

- **Desserts** offer the **Oreo Cookie Chocolate Shake**, which has 14 grams of protein, making it a sweet yet protein-rich option.

## ❓ Top 10 items with the highest calories


## ⌨️ **SQL Code :**

    SELECT item FROM burger_king_menu
    ORDER BY calories DESC
    LIMIT 10;

![Image](https://github.com/user-attachments/assets/44625a3a-f00d-4080-9cac-20260b0d57bb)

## 📊 **Insights :**

- **Burger King burgers dominate the high-calorie items** : burgers make up seven of the top ten items. **The Rodeo King™ Sandwich** leads the list with **1300 calories**, followed by other Whopper variants and the **Single Stacker King**.

- **Chicken items are also calorie-dense**: the **Spicy Chicken Nuggets (20pc)** and **Chicken Nuggets (20pc)** provide 1050 and 970 calories, respectively.

- **Breakfast item on the list**: the **BK Ultimate Breakfast Platter**, with **970 calories**, is the only breakfast item in the top ten. It reflects a significant amount of calories typical of hearty breakfast options.

- **Whoppers and Stackers take the lead**: the **Double Whopper Sandwiches** and Single Quarter Pound King are also high calorie, a common characteristic of larger sandwiches that include multiple meats, cheese, and sauces.

## ❓ Top 10 items with the highest fat content


## ⌨️ **SQL Code :**

    SELECT * FROM burger_king_menu
    ORDER BY 'Fat (g)' DESC
    LIMIT 10;

![Image](https://github.com/user-attachments/assets/94e98a04-0e26-4308-a354-901f82146a1d)

## 📊 **Insights :**

- **Burger items dominate the fat content**: burgers make up seven of the top ten items. The **Rodeo King™ Sandwich** leads with 83 grams of fat, followed closely by the **Triple Whopper Sandwich with Cheese** and **Bacon King™ Sandwich**, which have 82 and 81 grams of fat, respectively.

- **Chicken options also high in fat**: both **Spicy Chicken Nuggets (20pc)** and **Chicken Nuggets (20pc)** contain significant fat amounts (74 and 62 grams), making them calorie-dense and fat-rich options.

- **Breakfast item** included: the **Double Croissan’wich with Sausage** has 54 grams of fat, making it a high-fat breakfast option.

- **Large sandwiches and combined meats**: items like the **Double Whopper Sandwiches** and **Single Quarter Pound King Sandwich** also have high fat content, commonly found in larger sandwiches with multiple meats and cheese.


## ❓ Top 10 Highest Trans Fat Items


## ⌨️ **SQL Code :**

    SELECT * 
    FROM burger_king_menu
    ORDER BY 'Trans Fat (g)' DESC
    LIMIT 10;

![Image](https://github.com/user-attachments/assets/67d322b7-3789-49f7-86ea-0e27fd68727c)

## 📊 **Insights :**

- **Triple Whopper leads in trans fat**:

     - At **4.5g of trans fat**, the **Triple Whopper Sandwich with Cheese** stands out significantly above all other menu items.

     - This single item contains **300% more trans fat** than any other item on the list.

- **Breakfast category dominates**:

     - **8 out of 10** of the highest trans fat items come from the **breakfast category**.

     - Common ingredients like **processed meats, biscuits, and croissants** likely contribute to the trans fat content.

- **Multiple items with same trans fat value**:

     - Several breakfast items contain exactly 1.0g of trans fat, suggesting a standardized use of certain ingredients.

- **Potential health risk**:

     - **Trans fats are associated with increased risk of heart disease, stroke, and type 2 diabetes.**

     - Even small amounts are considered harmful according to **FDA and WHO guidelines.**


## ❓ Top 10 Highest Dietary Fiber Items

## ⌨️ **SQL Code :**

    SELECT *
    FROM burger_king_menu
    ORDER BY 'Dietary Fiber (g)' DESC
    LIMIT 10;

![Image](https://github.com/user-attachments/assets/1ddda35b-ff98-4fa0-8b7b-f87f615bd97d)

## 📊 **Insights :**

- **Chicken category dominates fiber list**:

     - **4 of the top 5** high-fiber items belong to the **"Chicken & More" category**, indicating that breaded or crispy chicken options may contain significant fiber due to the coating or additives.

- **Fiber from sides & breakfast**:

    -  **Onion rings** (large & medium) and **hash browns** add a noticeable amount of fiber, making sides a potential fiber boost for meals.

    -  Breakfast items like the **NY Ultimate Platter** contribute moderate fiber, likely from starchy components like potatoes and biscuits.

- **Surprising sources of fiber**:

     - Traditionally unhealthy items like the **Double Stacker King Burger** still provide **6g of fiber**, possibly due to buns and vegetable toppings.

- **Fiber for digestive health**:

     - Dietary fiber is crucial for **digestive wellness, blood sugar regulation, and satiety**.

     - These high-fiber items may be useful for people looking to meet daily fiber goals even when eating out.


# ❓ Healthy Index Score (Custom Formula)

    Healthy Index Score = ( Protein + Dietary Fiber ) / ( Calories + Fat + 1 )



 ​-  Protein and Dietary Fiber contribute positively to the score.

 - Calories and Fat contribute negatively to the score (since they increase the overall health impact).

 - The **"+1" is added to avoid division by zero.**


## ⌨️ **SQL Code :**

    SELECT item, 
           (protein_g * 2 + dietary_fiber_g * 1.5 - fat_g - sugars_g) AS health_score 
    FROM burger_king_menu
    ORDER BY health_score DESC
    LIMIT 10;


![Image](https://github.com/user-attachments/assets/32e38c6d-7606-43c2-bfe2-d830e2defca8)


## 📊 **Insights :**

- **Salads & Sides Take the Lead**: **3 out of the top 4 items** are salads without dressing, which significantly reduces fat and calories while preserving fiber and protein.

- **Beverage Category Surprise**: **Fat Free Milk** tops the list, showing how a **simple, low-fat dairy drink** offers high protein and calcium with low fat and sugar.

- **Balanced Burger Options Exist**: **Double Hamburger** and **Single Quarter Pound King** rank well due to a relatively better **protein-to-fat ratio** and **moderate calories**, compared to other heavy burgers.

- **Chicken Sandwiches in Moderation**: **Royal Crispy Chicken variants** score high due to their **protein content**, despite being slightly higher in fat.


# ❓ Finding the Most Balanced Meal (Equal Fat, Protein, and Carbs)

- **Normalize the Nutrient Differences**: Subtract the values of each nutrient (Fat, Protein, and Carbs) from each other, then take the **absolute value** to find the difference.

- **Calculate the Total Difference**: The sum of the differences will give you a measure of how "unbalanced" the meal is. The smaller the value, the more balanced the meal is.

        Balance Score = | Fat − Protein | + | Protein - Carbs | + | Carbs  - Fat | 

- **Smaller Balance Score**: The meal with the smallest Balance Score will be the most balanced.


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


![Image](https://github.com/user-attachments/assets/24c26707-54bf-4b07-8164-9a0174edcb96)


## 📊 **Insights :**

- **American Cheese Slice** – the **most nutritionally balanced item**, though small in quantity, with very close values in fat, protein, and carbs.

- **Chicken Nuggets (4pc)** and **Sandwiches** like the **Single Quarter Pound King** deliver **balanced macronutrient ratios**, making them suitable for those aiming for equilibrium over extremes.

- **Salads and side items** like **Garden Side Salad** also show balance, particularly when consumed without dressing.

- **Sugary and dessert items** (e.g., Soft Serve Cone, Cookies) tend to have **high carbs but low protein and fat**, making them imbalanced despite low calories.


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

![Image](https://github.com/user-attachments/assets/eb9c7c5e-86d3-41c7-9ac1-0ddc3e56f9ec)

## 📊 **Insights :**
- **High Protein Content**:

  - The **Triple WHOPPER Sandwich with Cheese** tops the list with **71g of protein**, followed closely by the **Bacon KingTM Sandwich (66g)** and **Single Stacker King (65g)**, all from the **Burgers** category. These items provide a **high protein intake**, making them ideal for those looking to build muscle or increase protein consumption.

- **Moderate Protein & High Carbs**:

  - Many of the high-protein options like the **RODEO KingTM Sandwich (63g protein, 77g carbs)** and **Single Quarter Pound King Sandwich (57g protein, 56g carbs)** also contain significant **carb content**, making them a **more energy-dense option**, suitable for individuals needing energy-intensive meals.

- **Balanced Options**:

  - The **Chicken Nuggets- 20pc** and **Chicken Club Salad (without dressing)**, both in the **Chicken & More and Salads & Sides** categories, offer **45g of protein** while maintaining a reasonable carb count (60g and 82g, respectively). These items strike a balance between **protein** and **carbs**, providing a good choice for those seeking a combination of both nutrients.

- **Slightly Lower Protein but High Carbs**:

  - Items like the **Bacon & Cheese WHOPPER Sandwich (40g protein, 56g carbs)** and **Spicy Chicken Nuggets- 20pc (40g protein, 56g carbs)** offer **moderate protein** but are still **carb-heavy**, making them more filling and suitable for those seeking a heartier meal.

- **Breakfast Option**:

  - The **EGG-NORMOUS BURRITO**, with **34g of protein** and **69g of carbs**, is the **highest-protein breakfast item**, making it an excellent choice for a high-protein breakfast option for individuals looking to start their day with a **protein-rich meal**.

- **Healthier Choices**:

  - The **Chicken Garden Salad (without dressing)** and **Chicken Club Salad (without dressing)** provide **36g and 45g of protein**, respectively, while keeping the carb content at **56g and 82g**. These are relatively healthier options for those looking to **maintain protein** intake while keeping their **carb consumption** in check.


# ❓ Salt-to-Fat Ratio

 -  **What's the Salt-to-Fat Ratio?**
    - **A higher salt-to-fat ratio means** you're getting a **lot of salt** for each gram of fat, which can be important for those monitoring **salt intake** (e.g., those with high blood pressure).

    - **Low-fat items** like the **IMPOSSIBLE Whopper** and **Hamburger** have a **lower salt-to-fat ratio** (56) but still contain **significant sodium.**

## ⌨️ **SQL Code :**

    SELECT item, sodium_mg, fat_g, (sodium_mg / NULLIF(fat_g, 0)) AS salt_fat_ratio
    FROM burger_king_menu
    ORDER BY salt_fat_ratio DESC
    LIMIT 10;

![Image](https://github.com/user-attachments/assets/d8f38e93-7071-4fb2-9874-cbeb7705d875)

## 📊 **Insights :**

-  **Items to Watch Out For**:

    - **Ham, Egg & Cheese Biscuit: 70 is extremely high** – avoid if reducing sodium intake is a concern.

    - **Bacon, Egg & Cheese Biscuit (52.7) is also high**, though slightly lower than the former.

-  **Highest Salt-to-Fat Ratios**:

    - **Ham, Egg & Cheese Biscuit leads with a ratio of 70** (1610mg sodium per 23g fat), indicating extremely high salt per fat content.

- **Other notable high ratios**:

   - **Cheeseburger & Chicken Fries (9 pc)**: 60.00 each (780mg sodium per 13g fat).

   - **Buttery Garlic Croutons: 60.00** (180mg sodium per 3g fat).


-  **Balanced Items**:

   - **IMPOSSIBLE Whopper** (56) and **Hamburger** (56) are good options for a lower salt-to-fat ratio while still providing a decent fat content.


# ❓ Fat-to-Calorie Ratio


## ⌨️ **SQL Code :**

    SELECT item, fat_calories, calories, (fat_calories / NULLIF(calories, 0)) AS fat_cal_ratio
    FROM burger_king_menu
    ORDER BY fat_cal_ratio DESC
    LIMIT 10;

![Image](https://github.com/user-attachments/assets/093fc457-e6ac-4099-9cb9-dfb90f92249e)

## 📊 **Insights :**

- **Mayonnaise (Packet)** leads with **a ratio of 1.0** (80g fat per 80 calories), which means 100% of the calories come from fat.

- **Ken's Golden Italian Dressing: 0.947** (180g fat per 190 calories) is **close** behind, showing that this dressing is **highly calorie-dense from fat**.

- **Zesty Onion Ring Dipping Sauce** and **Ranch Dipping Sauce** also have **relatively high ratios (0.93 and 0.93 respectively)**, meaning they are **mostly fat**.

- **High fat-to-calorie ratios** like **Mayonnaise, Ken's Ranch Dressing**, and **Buffalo Dipping Sauce** can be **very calorie-dense** with **minimal nutritional diversity**, mainly providing fat and little else.
    
# ❓ Least Healthy Items (Highest Calories & Fat)

## ⌨️ **SQL Code :**

    SELECT item, calories, fat_g 
    FROM burger_king_menu
    ORDER BY calories DESC, fat_g DESC
    LIMIT 10;

![Image](https://github.com/user-attachments/assets/23bae368-6747-4437-843f-2f5d2d97d0b4)

## 📊 **Insights :**

 - **Items with the Highest Calories & Fat**:

    - **RODEO KingTM Sandwich: 1300 calories, 83g of fat** — The **most calorie-dense** and **fat-heavy** option.

    - **Triple WHOPPER Sandwich with Cheese: 1220 calories, 82g of fat** — A **close contender**, packed with fat and calories.

    - **BACON KingTM Sandwich: 1200 calories, 81g of fat** — Another **high-calorie, high-fat** burger.

- **Other High-Calorie & Fat Items**:

    - **Spicy Chicken Nuggets- 20 pc: 1050 calories, 74g of fat** — A **fried** snack high in both calories and fat.

    - **DOUBLE WHOPPER Sandwich with Cheese: 1010 calories, 65g of fat** — Another **whopper** full of calories and fat.

- **More Balanced (But Still High)**:

    - **BK Ultimate Breakfast Platter: 970 calories, 48g of fat** — While the fat content is **lower**, the calories are still quite high.

    - **Chicken Nuggets- 20pc: 970 calories, 62g of fat** — A **high-calorie and high-fat** snack option.

- **Key Takeaway**:

    - The **least healthy options** generally come from the **burgers and fried items**, where calories and fat content are the highest. These options may not be ideal for anyone looking to **manage fat and calorie intake** effectively.


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

![Image](https://github.com/user-attachments/assets/e9b356ca-52eb-4d63-add4-8ca28e323ac9)
![Image](https://github.com/user-attachments/assets/4f46457b-4ec7-4e8d-be47-6005369ee3ba)


## 📊 **Insights :**

- **Zero-Sodium Options Exist**: Several beverages (like BK Cafe Coffee and Sweet Tea) and condiments (jam, syrup) contain no sodium, making them ideal for individuals watching their salt intake.

- **Salads & Sides Offer Low-Sodium Support**: Items like the Garden Side Salad and small French Fries are good low-sodium meal additions.

- **Lower-Sodium Burgers & Breakfast**: Basic burgers like the Whopper Jr. and Hamburger are surprisingly moderate in sodium compared to other fast-food items.

- **Desserts Are Heart-Friendly**: Desserts like Chocolate Chip Cookies and Soft Serve are relatively low in sodium, making them a safer treat option.

# 🎯 **Presentation Link :**  
https://gamma.app/docs/Healthy-Menu-Choices-at-Burger-King-Insights-Recommendations-yzhxvuwzotg30g8

# 🏆 **Final Recommendation**  

- **Promote High-Fiber and High-Protein Meals**:
     - Encourage customers to choose menu items that are rich in **fiber** and **protein**. These nutrients are essential for digestive health, weight management, and muscle maintenance. Highlighting these items will cater to health-conscious customers.

- **Introduce Healthier Meal Combos**:
     - **Create meal combos** that provide a balanced mix of **protein, carbs, and fat**. These balanced meals can be marketed as the **nutritionally optimal choice** for customers aiming for a well-rounded diet.

- **Provide Sodium-Conscious Menu Labeling**:
     - Implement **sodium-conscious menu labeling** to help customers easily identify **heart-healthy options**. This will be especially beneficial for customers who are conscious of their sodium intake due to concerns over **high blood pressure and heart health**.

- **Optimize Menu Pricing & Marketing Strategy**:
     - Base **menu pricing and marketing strategies** on the **healthiest and most preferred** items. By highlighting nutrient-rich meals and offering **discounts or combos**, customers will be more likely to choose healthier options.

- **Enhance Digital Menu Boards & Ordering Systems**:
     - Integrate **real-time nutritional insights** into digital menu boards and ordering systems. This can include showing **calories, protein, fat, sodium** content for each item, allowing customers to make **informed choices** while placing their orders.
 
       
# 🎯 **Conclusion** 

Through this detailed analysis, we've gained valuable insights into the nutritional profiles of Burger King's menu. Key highlights of the study include:

- **High-Fiber and High-Protein Meals**: Identifying menu items rich in **fiber and protein** is crucial for customers focused on promoting **digestive health** and **muscle maintenance**.

- **Health Score Rankings**: A **custom health score formula** allowed for a clear comparison of menu items, making it easier for customers to see which items align with their health goals. The scoring system considered **fiber, protein, fat, calories, and sodium levels**.

- **Balanced Meals**: A balance of **protein, fat, and carbs** is essential for overall health. Certain beverages like **unsweetened tea and black coffee** are excellent zero-calorie choices that can support weight management.

- **Sodium-Conscious Choices**: The analysis on **sodium** content allowed us to identify heart-healthy menu items with low sodium, which can aid customers in managing **blood pressure and cardiovascular health.**

In conclusion, this project has equipped us with insights that can help Burger King offer healthier meal options, promote **nutritional transparency**, and encourage healthier eating habits. By implementing the recommendations above, Burger King can position itself as a leader in **healthy fast food options** while catering to a growing demand for **health-conscious dining**.




