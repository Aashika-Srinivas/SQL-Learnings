/**
--Creating Dessert
--Aashika
--Relational DB
--Version 1.0
*/

--DDL - DATA DEFINITION LANGUAGE
-- CREATE, DROP, ALTER

--DROPPING TABLE
DROP TABLE Dessert CASCADE CONSTRAINTS;
DROP TABLE Recipe CASCADE CONSTRAINTS;
DROP TABLE Dry_Ingredient CASCADE CONSTRAINTS;
DROP TABLE Wet_Ingredient CASCADE CONSTRAINTS;
DROP TABLE Dry_Quantity CASCADE CONSTRAINTS;
DROP TABLE Wet_Quantity CASCADE CONSTRAINTS;
DROP TABLE Device_Used CASCADE CONSTRAINTS;
DROP TABLE Dessert_Devices CASCADE CONSTRAINTS;

--DROPPING SEQUENCE
DROP SEQUENCE seq_Dessert;
DROP SEQUENCE seq_Recipe;
DROP SEQUENCE seq_Dry_Ingredient;
DROP SEQUENCE seq_Wet_Ingredient;
DROP SEQUENCE seq_Dry_Quantity;
DROP SEQUENCE seq_Wet_Quantity;
DROP SEQUENCE seq_Device_Used;
DROP SEQUENCE seq_Dessert_Devices;

CREATE TABLE Dessert(
  idDessert INT PRIMARY KEY,
  nameDessert VARCHAR(45) NOT NULL,
  prepTime VARCHAR(45) NOT NULL,
  cookTime VARCHAR(45) NOT NULL,
  totalTime VARCHAR(45) NULL,
  bakeTemp VARCHAR(45) NULL,
  totalCalories DECIMAL NULL,
  servings INT NULL
);
CREATE TABLE Recipe(
  idRecipe INT PRIMARY KEY,
  idDessert INT NOT NULL,
  linkRecipe VARCHAR(200) NOT NULL,
  rating_Recipe VARCHAR(20) NULL,
  CONSTRAINT fk_Dessert FOREIGN KEY (idDessert) REFERENCES Dessert(idDessert)
);
CREATE TABLE Dry_Ingredient(
  idDry_Ingredient INT PRIMARY KEY,
  nameDry_Ingredient VARCHAR(20) NOT NULL
);
CREATE TABLE Wet_Ingredient(
  idWet_Ingredient INT PRIMARY KEY,
  nameWet_Ingredient VARCHAR(20) NOT NULL
);
CREATE TABLE Dry_Quantity(
  idDry_quantity INT NOT NULL,
  idDessert INT NOT NULL,
  idDry_Ingredient INT NOT NULL,
  quantity_Cup VARCHAR(20) NOT NULL,
  quantity_Metric VARCHAR(20) NOT NULL,
  quantity_Imperial VARCHAR(20) NOT NULL,
  CONSTRAINT fk_Dessert_Dry FOREIGN KEY (idDessert) REFERENCES Dessert(idDessert),
  CONSTRAINT fk_DryIng FOREIGN KEY (idDry_Ingredient) REFERENCES Dry_Ingredient(idDry_Ingredient)
);
CREATE TABLE Wet_Quantity(
  idWet_quantity INT NOT NULL,
  idDessert INT NOT NULL,
  idWet_Ingredient INT NOT NULL,
  quantity_Cup VARCHAR(20) NOT NULL,
  quantity_Metric VARCHAR(20) NOT NULL,
  quantity_Imperial VARCHAR(20) NOT NULL,
  CONSTRAINT fk_Dessert_Wet FOREIGN KEY (idDessert) REFERENCES Dessert(idDessert),
  CONSTRAINT fk_WetIng FOREIGN KEY (idWet_Ingredient) REFERENCES Wet_Ingredient(idWet_Ingredient)
);
CREATE TABLE Device_Used(
  idDevice INT PRIMARY KEY,
  nameDevice VARCHAR(45) NOT NULL
);
CREATE TABLE Dessert_Devices(
  idDessert_Device INT NOT NULL,
  idDessert INT NOT NULL,
  idDevice INT NOT NULL,
  CONSTRAINT fk_Dessert_Device FOREIGN KEY (idDessert) REFERENCES Dessert(idDessert),
  CONSTRAINT fk_Device FOREIGN KEY (idDevice) REFERENCES Device_Used(idDevice)
);

-- CREATE SEQUENCES
CREATE SEQUENCE seq_Dessert;
CREATE SEQUENCE seq_Recipe;
CREATE SEQUENCE seq_Dry_Ingredient;
CREATE SEQUENCE seq_Wet_Ingredient;
CREATE SEQUENCE seq_Dry_Quantity;
CREATE SEQUENCE seq_Wet_Quantity;
CREATE SEQUENCE seq_Device_Used;
CREATE SEQUENCE seq_Dessert_Devices;

--DML - DATA MANIPULATION LANGUAGE
-- INSERT INTO, UPDATE, DELETE

--Dessert Table
INSERT INTO Dessert (idDessert,nameDessert,prepTime,cookTime,totalTime,bakeTemp,totalCalories,servings)
VALUES (seq_Dessert.NEXTVAL, 'Birthday Cake', '30 mins', '1 hr 30 mins', '2hrs', '180C', 1000.8 ,16);
INSERT INTO Dessert (idDessert,nameDessert,prepTime,cookTime,totalTime,bakeTemp,totalCalories,servings)
VALUES (seq_Dessert.NEXTVAL, 'Neapolitan Bundt Cake', '15 mins', '1 hr 45 mins', '2hrs', '180C', 1000.8 ,12);
INSERT INTO Dessert (idDessert,nameDessert,prepTime,cookTime,totalTime,bakeTemp,totalCalories,servings)
VALUES (seq_Dessert.NEXTVAL, 'Swiss Roll Cake', '15 mins', '1 hr', '1 hr 15 mins', '180C', 1000.8 ,12);
INSERT INTO Dessert (idDessert,nameDessert,prepTime,cookTime,totalTime,bakeTemp,totalCalories,servings)
VALUES (seq_Dessert.NEXTVAL, 'Brownies', '15 mins', '20 mins', '35 mins', '180C', 229 ,20);
INSERT INTO Dessert (idDessert,nameDessert,prepTime,cookTime,totalTime,bakeTemp,totalCalories,servings)
VALUES (seq_Dessert.NEXTVAL, 'Millionaires Shortbread', '20 mins', '40 mins', '4 hrs', '180C', 1050,16);

--Recipe Table
INSERT INTO Recipe (idRecipe,idDessert,linkRecipe,rating_Recipe)
VALUES (seq_Recipe.NEXTVAL, 1, 'https://www.delish.com/cooking/recipe-ideas/a23120595/funfetti-cake-birthday-cake-recipe/', '4.9/5');
INSERT INTO Recipe (idRecipe,idDessert,linkRecipe,rating_Recipe)
VALUES (seq_Recipe.NEXTVAL, 2, 'https://www.delish.com/cooking/recipe-ideas/a22998713/neapolitan-bundt-cake-recipe/', '4.0/5');
INSERT INTO Recipe (idRecipe,idDessert,linkRecipe,rating_Recipe)
VALUES (seq_Recipe.NEXTVAL, 3, 'https://www.delish.com/cooking/recipes/a49982/swiss-roll-cake-recipe/', '4.5/5');
INSERT INTO Recipe (idRecipe,idDessert,linkRecipe,rating_Recipe)
VALUES (seq_Recipe.NEXTVAL, 4, 'https://www.allrecipes.com/recipe/9599/quick-and-easy-brownies/', '4.7/5');
INSERT INTO Recipe (idRecipe,idDessert,linkRecipe,rating_Recipe)
VALUES (seq_Recipe.NEXTVAL, 5, 'https://www.janespatisserie.com/2020/04/22/millionaires-shortbread-2/', '4.9/5');

--Dry Ingredient table
INSERT INTO Dry_Ingredient (idDry_Ingredient,nameDry_Ingredient)
VALUES (seq_Dry_Ingredient.NEXTVAL, 'sugar');
INSERT INTO Dry_Ingredient (idDry_Ingredient,nameDry_Ingredient)
VALUES (seq_Dry_Ingredient.NEXTVAL, 'all-purpose flour');
INSERT INTO Dry_Ingredient (idDry_Ingredient,nameDry_Ingredient)
VALUES (seq_Dry_Ingredient.NEXTVAL, 'baking powder');
INSERT INTO Dry_Ingredient (idDry_Ingredient,nameDry_Ingredient)
VALUES (seq_Dry_Ingredient.NEXTVAL, 'cake mix');
INSERT INTO Dry_Ingredient (idDry_Ingredient,nameDry_Ingredient)
VALUES (seq_Dry_Ingredient.NEXTVAL, 'chocolate chips');
INSERT INTO Dry_Ingredient (idDry_Ingredient,nameDry_Ingredient)
VALUES (seq_Dry_Ingredient.NEXTVAL, 'sprinkles');
INSERT INTO Dry_Ingredient (idDry_Ingredient,nameDry_Ingredient)
VALUES (seq_Dry_Ingredient.NEXTVAL, 'cornstarch');
INSERT INTO Dry_Ingredient (idDry_Ingredient,nameDry_Ingredient)
VALUES (seq_Dry_Ingredient.NEXTVAL, 'cocoa powder');
INSERT INTO Dry_Ingredient (idDry_Ingredient,nameDry_Ingredient)
VALUES (seq_Dry_Ingredient.NEXTVAL, 'salt');
INSERT INTO Dry_Ingredient (idDry_Ingredient,nameDry_Ingredient)
VALUES (seq_Dry_Ingredient.NEXTVAL, 'walnuts');
INSERT INTO Dry_Ingredient (idDry_Ingredient,nameDry_Ingredient)
VALUES (seq_Dry_Ingredient.NEXTVAL, 'milk chocolate');
INSERT INTO Dry_Ingredient (idDry_Ingredient,nameDry_Ingredient)
VALUES (seq_Dry_Ingredient.NEXTVAL, 'white chocolate');

--Wet Ingredient table
INSERT INTO Wet_Ingredient (idWet_Ingredient,nameWet_Ingredient)
VALUES (seq_Wet_Ingredient.NEXTVAL, 'butter');
INSERT INTO Wet_Ingredient (idWet_Ingredient,nameWet_Ingredient)
VALUES (seq_Wet_Ingredient.NEXTVAL, 'eggs');
INSERT INTO Wet_Ingredient (idWet_Ingredient,nameWet_Ingredient)
VALUES (seq_Wet_Ingredient.NEXTVAL, 'vanilla extract');
INSERT INTO Wet_Ingredient (idWet_Ingredient,nameWet_Ingredient)
VALUES (seq_Wet_Ingredient.NEXTVAL, 'heavy cream');
INSERT INTO Wet_Ingredient (idWet_Ingredient,nameWet_Ingredient)
VALUES (seq_Wet_Ingredient.NEXTVAL, 'sour cream');
INSERT INTO Wet_Ingredient (idWet_Ingredient,nameWet_Ingredient)
VALUES (seq_Wet_Ingredient.NEXTVAL, 'chocolate syrup');
INSERT INTO Wet_Ingredient (idWet_Ingredient,nameWet_Ingredient)
VALUES (seq_Wet_Ingredient.NEXTVAL, 'strawberry syrup');
INSERT INTO Wet_Ingredient (idWet_Ingredient,nameWet_Ingredient)
VALUES (seq_Wet_Ingredient.NEXTVAL, 'marshmellow creme');
INSERT INTO Wet_Ingredient (idWet_Ingredient,nameWet_Ingredient)
VALUES (seq_Wet_Ingredient.NEXTVAL, 'milk');
INSERT INTO Wet_Ingredient (idWet_Ingredient,nameWet_Ingredient)
VALUES (seq_Wet_Ingredient.NEXTVAL, 'golden syrup');
INSERT INTO Wet_Ingredient (idWet_Ingredient,nameWet_Ingredient)
VALUES (seq_Wet_Ingredient.NEXTVAL, 'condensed milk');

--Dry Ingredient quantity
--Birthday Cake
INSERT INTO Dry_Quantity (idDry_quantity,idDessert,idDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 1, 1, '8 1/4 cups', '1658g', '58.58oz');
INSERT INTO Dry_Quantity (idDry_quantity, idDessert,idDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 1, 2, '3 cups', '408g', '24oz');
INSERT INTO Dry_Quantity (idDry_quantity, idDessert,idDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 1, 3, '2 tsp', '2 tsp', '2 tsp');
INSERT INTO Dry_Quantity (idDry_quantity, idDessert,idDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 1, 6, '1/2 cup','64g', '4oz');
INSERT INTO Dry_Quantity (idDry_quantity, idDessert,idDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 1, 7, '1/4 cup','34g', '2oz');
--Neopolitan Bundt Cake
INSERT INTO Dry_Quantity (idDry_quantity,idDessert,idDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 2, 4, '1 box', '1 box', '1 box');
INSERT INTO Dry_Quantity (idDry_quantity, idDessert,idDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 2, 5, '1 1/2 cups', '192g', '6.75oz');
--Swiss roll
INSERT INTO Dry_Quantity (idDry_quantity,idDessert,idDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 3, 4, '1 box', '1 box', '1 box');
INSERT INTO Dry_Quantity (idDry_quantity, idDessert,idDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 3, 5, '1 1/2 cups', '192g', '6.75oz');
INSERT INTO Dry_Quantity (idDry_quantity, idDessert,idDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 3, 1, '1 cup', '128g', '4.5oz');
--Brownies
INSERT INTO Dry_Quantity (idDry_quantity,idDessert,idDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 4, 1, '2 cups', '402g', '14.2oz');
INSERT INTO Dry_Quantity (idDry_quantity,idDessert,idDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 4, 2, '1 1/2 cups', '204g', '7.2oz');
INSERT INTO Dry_Quantity (idDry_quantity,idDessert,idDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 4, 3, '1/2 tsp', '1/2 tsp', '1/2 tsp');
INSERT INTO Dry_Quantity (idDry_quantity,idDessert,idDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 4, 8, '1/2 cup', '68g', '2.4oz');
INSERT INTO Dry_Quantity (idDry_quantity,idDessert,idDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 4, 9, '1/2 tsp', '1/2 tsp', '1/2 tsp');
INSERT INTO Dry_Quantity (idDry_quantity,idDessert,idDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 4, 10, '1/2 cup', '64g', '2.25oz');
--Shortbread
INSERT INTO Dry_Quantity (idDry_quantity,idDessert,idDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 5, 1, '3/4 cup', '142.3g', '5oz');
INSERT INTO Dry_Quantity (idDry_quantity,idDessert,idDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 5, 2, '2 cups', '275g', '9.7oz');
INSERT INTO Dry_Quantity (idDry_quantity,idDessert,idDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 5, 11, '1 1/2 cups', '200g', '7.5oz');
INSERT INTO Dry_Quantity (idDry_quantity,idDessert,idDry_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Dry_Quantity.NEXTVAL, 5, 12, '3/4 cup', '100g', '3.6oz');

--Wet Ingredient quantity
--Birthday Cake
INSERT INTO Wet_Quantity (idWet_quantity, idDessert,idWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 1, 1, '3 cups', '681ml', '24oz');
INSERT INTO Wet_Quantity (idWet_quantity, idDessert,idWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 1, 2, '4 large', '4 large', '4 large' );
INSERT INTO Wet_Quantity (idWet_quantity, idDessert,idWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 1, 3, '1 tbsp + 1 tsp', '1 tbsp + 1 tsp', '1 tbsp + 1 tsp');
INSERT INTO Wet_Quantity (idWet_quantity, idDessert,idWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 1, 4, '1/4 cups', '59.25ml', '2fl oz'  );
INSERT INTO Wet_Quantity (idWet_quantity, idDessert,idWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 1, 5, '1/4 cups', '59.25ml', '2fl oz' );
INSERT INTO Wet_Quantity (idWet_quantity, idDessert,idWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 1, 9, '1 1/4 cups', '296.25ml', '10fl oz' );
--Neopolitan Bundt Cake
INSERT INTO Wet_Quantity (idWet_quantity, idDessert,idWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 2, 1, '1/3 cups', '76ml', '3fl oz');
INSERT INTO Wet_Quantity (idWet_quantity, idDessert,idWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 2, 2, '3 egg whites', '3 egg whites', '3 egg whitese' );
INSERT INTO Wet_Quantity (idWet_quantity, idDessert,idWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 2, 3, '1 tsp', '1 tsp', '1 tsp');
INSERT INTO Wet_Quantity (idWet_quantity, idDessert,idWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 2, 4, '3/4 cups', '200ml', '6fl oz'  );
INSERT INTO Wet_Quantity (idWet_quantity, idDessert,idWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 2, 6, '1/4 cups', '59.25ml', '2fl oz' );
INSERT INTO Wet_Quantity (idWet_quantity, idDessert,idWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 2, 7, '2 tbsp', '2 tbsp', '2 tbsp' );
INSERT INTO Wet_Quantity (idWet_quantity, idDessert,idWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 2, 9, '1 cup', '237ml', '8fl oz' );
--Swiss roll
INSERT INTO Wet_Quantity (idWet_quantity, idDessert,idWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 3, 1, '1/2 cup', '118.5ml', '4fl oz');
INSERT INTO Wet_Quantity (idWet_quantity, idDessert,idWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 3, 3, '1 tsp', '1 tsp', '1 tsp');
INSERT INTO Wet_Quantity (idWet_quantity, idDessert,idWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 3, 4, '3/4 cup', '200ml', '6fl oz');
INSERT INTO Wet_Quantity (idWet_quantity, idDessert,idWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 3, 8, '1 cup', '237ml', '7.5fl oz'  );
--brownies
INSERT INTO Wet_Quantity (idWet_quantity, idDessert,idWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 4, 1, '1 cup', '237ml', '8fl oz');
INSERT INTO Wet_Quantity (idWet_quantity, idDessert,idWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 4, 2, '4 eggs', '4 eggs', '4 eggs');
INSERT INTO Wet_Quantity (idWet_quantity, idDessert,idWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 4, 3, '1 tsp', '1 tsp', '1 tsp');
--shortbread
INSERT INTO Wet_Quantity (idWet_quantity, idDessert,idWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 5, 1, '1 3/4 cup', '400ml', '14fl oz');
INSERT INTO Wet_Quantity (idWet_quantity, idDessert,idWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 5, 10, '4 tbsp', '4 tbsp', '4 tbsp');
INSERT INTO Wet_Quantity (idWet_quantity, idDessert,idWet_Ingredient,quantity_Cup,quantity_Metric, quantity_Imperial)
VALUES (seq_Wet_Quantity.NEXTVAL, 5, 11, '1 3/4 cup', '400ml', '14fl oz');

--Devices
INSERT INTO Device_Used (idDevice,nameDevice)
VALUES (seq_Device_Used.NEXTVAL, 'oven');
INSERT INTO Device_Used (idDevice,nameDevice)
VALUES (seq_Device_Used.NEXTVAL, 'hand mixer');
INSERT INTO Device_Used (idDevice,nameDevice)
VALUES (seq_Device_Used.NEXTVAL, 'cake pans');

--Dessert Device
--Birthday Cake
INSERT INTO Dessert_Devices (idDessert_Device, idDessert,idDevice)
VALUES (seq_Dessert_Devices.NEXTVAL,1, 1);
INSERT INTO Dessert_Devices (idDessert_Device, idDessert,idDevice)
VALUES (seq_Dessert_Devices.NEXTVAL,1, 2);
INSERT INTO Dessert_Devices (idDessert_Device, idDessert,idDevice)
VALUES (seq_Dessert_Devices.NEXTVAL,1, 3);
--Neopolitan Bundt cake
INSERT INTO Dessert_Devices (idDessert_Device, idDessert,idDevice)
VALUES (seq_Dessert_Devices.NEXTVAL,2, 1);
INSERT INTO Dessert_Devices (idDessert_Device, idDessert,idDevice)
VALUES (seq_Dessert_Devices.NEXTVAL,2, 2);
INSERT INTO Dessert_Devices (idDessert_Device, idDessert,idDevice)
VALUES (seq_Dessert_Devices.NEXTVAL,2, 3);
--Swiss roll
INSERT INTO Dessert_Devices (idDessert_Device, idDessert,idDevice)
VALUES (seq_Dessert_Devices.NEXTVAL,3, 1);
INSERT INTO Dessert_Devices (idDessert_Device, idDessert,idDevice)
VALUES (seq_Dessert_Devices.NEXTVAL,3, 2);
INSERT INTO Dessert_Devices (idDessert_Device, idDessert,idDevice)
VALUES (seq_Dessert_Devices.NEXTVAL,3, 3);
--Brownies
INSERT INTO Dessert_Devices (idDessert_Device, idDessert,idDevice)
VALUES (seq_Dessert_Devices.NEXTVAL,4, 1);
INSERT INTO Dessert_Devices (idDessert_Device, idDessert,idDevice)
VALUES (seq_Dessert_Devices.NEXTVAL,4, 3);
--shortbread
INSERT INTO Dessert_Devices (idDessert_Device, idDessert,idDevice)
VALUES (seq_Dessert_Devices.NEXTVAL,5, 1);
INSERT INTO Dessert_Devices (idDessert_Device, idDessert,idDevice)
VALUES (seq_Dessert_Devices.NEXTVAL,5, 2);
INSERT INTO Dessert_Devices (idDessert_Device, idDessert,idDevice)
VALUES (seq_Dessert_Devices.NEXTVAL,5, 3);

COMMIT; -- ends transaction
-- query examples from the use cases:

-- SELECT <columns>
-- FROM <tables>
-- WHERE <connection or conditions>
-- ORDER BY ...
-- GROUP BY ...
-- HAVING ...
SELECT * FROM Dry_Quantity;
SELECT * FROM Wet_Quantity;

--Order the table by recipe rating (Ascending)
SELECT rating_Recipe, linkRecipe, nameDessert
FROM Recipe, Dessert
WHERE Recipe.idDessert = Dessert.idDessert
ORDER BY rating_Recipe;

--Group table by dry ing used in desserts
SELECT nameDessert,nameDry_Ingredient, quantity_Metric, quantity_Imperial, quantity_Cup
FROM Dessert, Dry_Ingredient, Dry_Quantity
WHERE Dessert.idDessert = Dry_Quantity.idDessert AND Dry_Ingredient.idDry_Ingredient = Dry_Quantity.idDry_Ingredient
GROUP BY nameDessert,nameDry_Ingredient, quantity_Metric,quantity_Imperial, quantity_Cup
ORDER BY Dessert.nameDessert;

--Group table by wet ing used in desserts
SELECT nameDessert,nameWet_Ingredient, quantity_Metric,quantity_Imperial, quantity_Cup
FROM Dessert, Wet_Ingredient, Wet_Quantity
WHERE Dessert.idDessert = Wet_Quantity.idDessert AND Wet_Ingredient.idWet_Ingredient = Wet_Quantity.idWet_Ingredient
GROUP BY nameDessert,nameWet_Ingredient, quantity_Metric,quantity_Imperial, quantity_Cup
ORDER BY Dessert.nameDessert;

--Outputs desserts with sugar in it
SELECT nameDessert, nameDry_Ingredient, quantity_Metric
FROM Dessert, Dry_Ingredient, Dry_Quantity
WHERE Dessert.idDessert = Dry_Quantity.idDessert
AND Dry_Ingredient.idDry_Ingredient = Dry_Quantity.idDry_Ingredient
AND (
    Dry_Ingredient.nameDry_Ingredient LIKE 'sugar'
);

--Outputs desserts with eggs in it
SELECT nameDessert, nameWet_Ingredient, quantity_Metric
FROM Dessert, Wet_Ingredient, Wet_Quantity
WHERE Dessert.idDessert = Wet_Quantity.idDessert
AND Wet_Ingredient.idWet_Ingredient = Wet_Quantity.idWet_Ingredient
AND (
    Wet_Ingredient.nameWet_Ingredient LIKE 'eggs'
);
 --Only brownie details - but since len(dry ing ) != len(wet ing) , prints so many times
SELECT nameDessert, nameDry_Ingredient,Dry_Quantity.quantity_Metric, nameWet_Ingredient,  Wet_Quantity.quantity_Metric, linkRecipe
FROM Dessert, Wet_Ingredient, Wet_Quantity, Dry_Quantity, Dry_Ingredient, Recipe
WHERE Dessert.idDessert = Wet_Quantity.idDessert
AND Dessert.idDessert = Dry_Quantity.idDessert
AND Wet_Ingredient.idWet_Ingredient = Wet_Quantity.idWet_Ingredient
AND Dry_Ingredient.idDry_Ingredient = Dry_Quantity.idDry_Ingredient
AND Recipe.idDessert = Dessert.idDessert
AND (
    Dessert.nameDessert LIKE 'Brownies'
);
