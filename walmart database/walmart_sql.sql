CREATE TABLE `sales` (
	`invoice_ID` VARCHAR(11) PRIMARY KEY,
    `branch` VARCHAR(1) NOT NULL,
    `city` VARCHAR(25) NOT NULL,
    `customer` VARCHAR(30) NOT NULL,
    `gender` VARCHAR(6) NOT NULL,
    `category` VARCHAR(75) NOT NULL,
    `unit_price` DECIMAL(6,2) NOT NULL,
    `quantity` INT NOT NULL,
    `tax` DECIMAL(5,5) NOT NULL,
    `total` DECIMAL(8,5) NOT NULL,
    `date` DATE NOT NULL,
    `time` TIME NOT NULL,
    `payment` VARCHAR(20) NOT NULL,
    `cog` DECIMAL(4,3) NOT NULL,
    `gross_margin_percent` DECIMAL(4,4) NOT NULL,
    `gross_income` DECIMAL(5,5) NOT NULL,
    `rating` DECIMAL(2,2) NOT NULL
);

ALTER TABLE `sales`
	MODIFY `invoice_ID` VARCHAR(30),
    MODIFY `branch` VARCHAR(5) NOT NULL,
    MODIFY `city` VARCHAR(30) NOT NULL,
    MODIFY `customer` VARCHAR(30) NOT NULL,
    MODIFY `gender` VARCHAR(10) NOT NULL,
    MODIFY `category` VARCHAR(100) NOT NULL,
    MODIFY `unit_price` DECIMAL(10,2) NOT NULL,
    MODIFY `quantity` INT NOT NULL,
    MODIFY `tax` DECIMAL(6,4) NOT NULL,
    MODIFY `total` DECIMAL(12,4) NOT NULL,
    MODIFY `date` DATE NOT NULL,
    MODIFY `time` TIME NOT NULL,
    MODIFY `payment` VARCHAR(20) NOT NULL,
    MODIFY `cog` DECIMAL(10,3) NOT NULL,
    MODIFY `gross_margin_percent` DECIMAL(11,9) NOT NULL,
    MODIFY `gross_income` DECIMAL(12,5) NOT NULL,
    MODIFY `rating` DECIMAL(2,1) NOT NULL;

SELECT  `category`,
		COUNT(*) AS category_count
        , AVG(`rating`) AS average_rating
        , SUM(`unit_price`) AS sum_unit_price
        , MAX(`rating`) AS max_rating
        , MIN(`rating`) AS min_rating
FROM `sales`
GROUP BY `category`;

SELECT `city`
		, COUNT(`customer`) AS customer_count
        , SUM(`unit_price`) AS unit_price_sum
        , SUM(`quantity`) AS quantity_sum
        , SUM(`unit_price` * `quantity`+`tax`) as total
        , SUM(`total`) AS drop_any_one_total
FROM `sales`
GROUP BY `city`;

-- Making new features/ Columns like time_of_day, month and year for better prediction/ analysis
SELECT *
		,(CASE
        WHEN `time` >= '18:00:00' AND `time` < '24:00:00' THEN 'Night'
        WHEN `time` >= '00:00:00' AND `time` < '12:00:00' THEN 'Morning'
        WHEN `time` >= '12:00:00' AND `time` < '15:00:00' THEN 'Afternoon'
        ELSE 'Evening'
		END)AS time_of_day
        ,(
			YEAR(`date`)
        ) AS year
        ,(
			MONTH(`date`)
        ) AS month
		
FROM `sales`;


-- SELECT 
-- FROM `sales`;

-- Selecting all rows from the table
SELECT * FROM `sales`;


