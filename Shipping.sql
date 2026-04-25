create database Shipping;
use shipping;

CREATE TABLE Dim_Ports (
    port_id INT PRIMARY KEY,
    port_name VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50),
    region VARCHAR(50)
);

CREATE TABLE Dim_Ships (
    ship_id INT PRIMARY KEY,
    ship_name VARCHAR(100),
    ship_type VARCHAR(50),   -- Cargo, Container, Tanker
    capacity INT
);

CREATE TABLE Dim_Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    company_type VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE Dim_Cargo (
    cargo_id INT PRIMARY KEY,
    cargo_type VARCHAR(50),   -- Electronics, Food, Chemicals
    category VARCHAR(50)
);

CREATE TABLE Dim_Date (
    date_id INT PRIMARY KEY,
    full_date DATE,
    year INT,
    quarter INT,
    month INT,
    month_name VARCHAR(20),
    day INT
);

CREATE TABLE Dim_Crew (
    crew_id INT PRIMARY KEY,
    crew_name VARCHAR(100),
    role VARCHAR(50),
    experience_years INT,
    nationality VARCHAR(50)
);

CREATE TABLE Fact_Shipments (
    shipment_id INT PRIMARY KEY,
    
    customer_id INT,
    ship_id INT,
    cargo_id INT,
    origin_port_id INT,
    destination_port_id INT,
    shipment_date_id INT,
    delivery_date_id INT,
    
    weight DECIMAL(10,2),
    expected_delivery_days INT,
    actual_delivery_days INT,
    delay_days INT,

    FOREIGN KEY (customer_id) REFERENCES Dim_Customers(customer_id),
    FOREIGN KEY (ship_id) REFERENCES Dim_Ships(ship_id),
    FOREIGN KEY (cargo_id) REFERENCES Dim_Cargo(cargo_id),
    FOREIGN KEY (origin_port_id) REFERENCES Dim_Ports(port_id),
    FOREIGN KEY (destination_port_id) REFERENCES Dim_Ports(port_id),
    FOREIGN KEY (shipment_date_id) REFERENCES Dim_Date(date_id),
    FOREIGN KEY (delivery_date_id) REFERENCES Dim_Date(date_id)
);

CREATE TABLE Fact_Sales (
    sales_id INT PRIMARY KEY,
    
    shipment_id INT,
    customer_id INT,
    sales_date_id INT,
    
    shipping_cost DECIMAL(10,2),
    revenue DECIMAL(10,2),
    profit DECIMAL(10,2),
    discount DECIMAL(10,2),

    FOREIGN KEY (shipment_id) REFERENCES Fact_Shipments(shipment_id),
    FOREIGN KEY (customer_id) REFERENCES Dim_Customers(customer_id),
    FOREIGN KEY (sales_date_id) REFERENCES Dim_Date(date_id)
);

CREATE TABLE Bridge_Shipment_Crew (
    shipment_id INT,
    crew_id INT,
    
    PRIMARY KEY (shipment_id, crew_id),

    FOREIGN KEY (shipment_id) REFERENCES Fact_Shipments(shipment_id),
    FOREIGN KEY (crew_id) REFERENCES Dim_Crew(crew_id)
);

-- Dim_Port
select count(*) from Dim_Ports;
INSERT INTO Dim_Ports VALUES

(1, 'Mumbai Port', 'Mumbai', 'India', 'Asia'),
(2, 'Chennai Port', 'Chennai', 'India', 'Asia'),
(3, 'Port of Singapore', 'Singapore', 'Singapore', 'Asia'),
(4, 'Port of Dubai', 'Dubai', 'UAE', 'Middle East'),
(5, 'Port of Rotterdam', 'Rotterdam', 'Netherlands', 'Europe'),
(6, 'Port of Shanghai', 'Shanghai', 'China', 'Asia'),
(7, 'Port of Hong Kong', 'Hong Kong', 'Hong Kong', 'Asia'),
(8, 'Port of Busan', 'Busan', 'South Korea', 'Asia'),
(9, 'Port of Tokyo', 'Tokyo', 'Japan', 'Asia'),
(10, 'Port of Los Angeles', 'Los Angeles', 'USA', 'North America'),
(11, 'Port of Long Beach', 'Long Beach', 'USA', 'North America'),
(12, 'Port of New York', 'New York', 'USA', 'North America'),
(13, 'Port of Hamburg', 'Hamburg', 'Germany', 'Europe'),
(14, 'Port of Antwerp', 'Antwerp', 'Belgium', 'Europe'),
(15, 'Port of Felixstowe', 'Felixstowe', 'UK', 'Europe'),
(16, 'Port of Barcelona', 'Barcelona', 'Spain', 'Europe'),
(17, 'Port of Genoa', 'Genoa', 'Italy', 'Europe'),
(18, 'Port of Marseille', 'Marseille', 'France', 'Europe'),
(19, 'Port of Santos', 'Santos', 'Brazil', 'South America'),
(20, 'Port of Buenos Aires', 'Buenos Aires', 'Argentina', 'South America'),
(21, 'Port of Durban', 'Durban', 'South Africa', 'Africa'),
(22, 'Port of Cape Town', 'Cape Town', 'South Africa', 'Africa'),
(23, 'Port of Lagos', 'Lagos', 'Nigeria', 'Africa'),
(24, 'Port of Alexandria', 'Alexandria', 'Egypt', 'Africa'),
(25, 'Port of Jebel Ali', 'Dubai', 'UAE', 'Middle East'),
(26, 'Port of Doha', 'Doha', 'Qatar', 'Middle East'),
(27, 'Port of Muscat', 'Muscat', 'Oman', 'Middle East'),
(28, 'Port of Karachi', 'Karachi', 'Pakistan', 'Asia'),
(29, 'Port of Colombo', 'Colombo', 'Sri Lanka', 'Asia'),
(30, 'Port of Chittagong', 'Chittagong', 'Bangladesh', 'Asia'),
(31, 'Port of Manila', 'Manila', 'Philippines', 'Asia'),
(32, 'Port of Jakarta', 'Jakarta', 'Indonesia', 'Asia'),
(33, 'Port of Ho Chi Minh', 'Ho Chi Minh City', 'Vietnam', 'Asia'),
(34, 'Port of Auckland', 'Auckland', 'New Zealand', 'Oceania'),
(35, 'Port of Sydney', 'Sydney', 'Australia', 'Oceania'),
(36, 'Port of Melbourne', 'Melbourne', 'Australia', 'Oceania'),
(37, 'Port of Vancouver', 'Vancouver', 'Canada', 'North America'),
(38, 'Port of Montreal', 'Montreal', 'Canada', 'North America'),
(39, 'Port of Seattle', 'Seattle', 'USA', 'North America'),
(40, 'Port of Miami', 'Miami', 'USA', 'North America'),
(41, 'Port of Houston', 'Houston', 'USA', 'North America'),
(42, 'Port of Rotterdam Maasvlakte', 'Rotterdam', 'Netherlands', 'Europe'),
(43, 'Port of Le Havre', 'Le Havre', 'France', 'Europe'),
(44, 'Port of Valencia', 'Valencia', 'Spain', 'Europe'),
(45, 'Port of Piraeus', 'Athens', 'Greece', 'Europe'),
(46, 'Port of Istanbul', 'Istanbul', 'Turkey', 'Europe'),
(47, 'Port of Izmir', 'Izmir', 'Turkey', 'Europe'),
(48, 'Port of Casablanca', 'Casablanca', 'Morocco', 'Africa'),
(49, 'Port of Mombasa', 'Mombasa', 'Kenya', 'Africa'),
(50, 'Port of Dar es Salaam', 'Dar es Salaam', 'Tanzania', 'Africa'),
(51, 'Port of Reykjavik', 'Reykjavik', 'Iceland', 'Europe'),
(52, 'Port of Oslo', 'Oslo', 'Norway', 'Europe'),
(53, 'Port of Stockholm', 'Stockholm', 'Sweden', 'Europe'),
(54, 'Port of Helsinki', 'Helsinki', 'Finland', 'Europe'),
(55, 'Port of Copenhagen', 'Copenhagen', 'Denmark', 'Europe');

INSERT INTO Dim_Ships VALUES

(1, 'Sea Carrier 1', 'Container', 5000),
(2, 'Ocean King', 'Bulk Carrier', 8000),
(3, 'Global Trader', 'Tanker', 6000),
(4, 'Blue Whale', 'Container', 7000),
(5, 'Ocean Titan', 'Bulk Carrier', 9000),
(6, 'Sea Explorer', 'Container', 6500),
(7, 'Marine Star', 'Tanker', 7000),
(8, 'Atlantic Carrier', 'Container', 8000),
(9, 'Pacific Voyager', 'Bulk Carrier', 7500),
(10, 'Neptune Trader', 'Tanker', 8500),
(11, 'Blue Ocean', 'Container', 7200),
(12, 'Silver Wave', 'Bulk Carrier', 7800),
(13, 'Golden Horizon', 'Container', 8200),
(14, 'Sea Falcon', 'Tanker', 6900),
(15, 'Ocean Spirit', 'Bulk Carrier', 7700),
(16, 'Marine King', 'Container', 8100),
(17, 'Aqua Giant', 'Tanker', 8800),
(18, 'Sea Dragon', 'Container', 7600),
(19, 'Ocean Breeze', 'Bulk Carrier', 7400),
(20, 'Titanic Star', 'Container', 8300),
(21, 'Wave Rider', 'Tanker', 7100),
(22, 'Blue Horizon', 'Container', 7900),
(23, 'Sea Pioneer', 'Bulk Carrier', 8600),
(24, 'Ocean Legend', 'Tanker', 9000),
(25, 'Marine Voyager', 'Container', 7800),
(26, 'Deep Sea King', 'Bulk Carrier', 9200),
(27, 'Atlantic Star', 'Container', 8000),
(28, 'Ocean Master', 'Tanker', 8700),
(29, 'Sea Navigator', 'Bulk Carrier', 7600),
(30, 'Blue Storm', 'Container', 8100),
(31, 'Marine Explorer', 'Tanker', 8500),
(32, 'Ocean Carrier', 'Bulk Carrier', 8800),
(33, 'Sea Champion', 'Container', 7900),
(34, 'Aqua Voyager', 'Tanker', 8600);

INSERT INTO Dim_Customers VALUES

(1, 'Reliance Industries', 'Corporate', 'India'),
(2, 'Tata Steel', 'Corporate', 'India'),
(3, 'Amazon Logistics', 'E-commerce', 'USA'),
(4, 'Flipkart', 'E-commerce', 'India'),
(5, 'Adani Group', 'Corporate', 'India'),
(6, 'Infosys', 'Corporate', 'India'),
(7, 'Wipro', 'Corporate', 'India'),
(8, 'Hindustan Unilever', 'Corporate', 'India'),
(9, 'ITC Limited', 'Corporate', 'India'),
(10, 'Mahindra Group', 'Corporate', 'India'),
(11, 'Apple Inc', 'Corporate', 'USA'),
(12, 'Samsung Electronics', 'Corporate', 'South Korea'),
(13, 'Sony Corporation', 'Corporate', 'Japan'),
(14, 'LG Electronics', 'Corporate', 'South Korea'),
(15, 'Dell Technologies', 'Corporate', 'USA'),
(16, 'HP Inc', 'Corporate', 'USA'),
(17, 'Lenovo', 'Corporate', 'China'),
(18, 'Alibaba Group', 'E-commerce', 'China'),
(19, 'Walmart', 'Retail', 'USA'),
(20, 'Target Corporation', 'Retail', 'USA'),
(21, 'Nike', 'Retail', 'USA'),
(22, 'Adidas', 'Retail', 'Germany'),
(23, 'Zara', 'Retail', 'Spain'),
(24, 'H&M', 'Retail', 'Sweden'),
(25, 'Nestle', 'Corporate', 'Switzerland'),
(26, 'Coca-Cola', 'Corporate', 'USA'),
(27, 'PepsiCo', 'Corporate', 'USA'),
(28, 'Unilever', 'Corporate', 'UK'),
(29, 'Procter & Gamble', 'Corporate', 'USA'),
(30, 'Siemens', 'Corporate', 'Germany'),
(31, 'General Electric', 'Corporate', 'USA'),
(32, 'Boeing', 'Corporate', 'USA'),
(33, 'Airbus', 'Corporate', 'France'),
(34, 'Ford Motor Company', 'Corporate', 'USA'),
(35, 'Toyota', 'Corporate', 'Japan'),
(36, 'Honda', 'Corporate', 'Japan'),
(37, 'Hyundai', 'Corporate', 'South Korea'),
(38, 'Volkswagen', 'Corporate', 'Germany'),
(39, 'BMW', 'Corporate', 'Germany'),
(40, 'Mercedes-Benz', 'Corporate', 'Germany'),
(41, 'ExxonMobil', 'Corporate', 'USA'),
(42, 'Shell', 'Corporate', 'Netherlands'),
(43, 'BP', 'Corporate', 'UK'),
(44, 'TotalEnergies', 'Corporate', 'France'),
(45, 'Chevron', 'Corporate', 'USA'),
(46, 'Glencore', 'Corporate', 'Switzerland'),
(47, 'ArcelorMittal', 'Corporate', 'Luxembourg'),
(48, 'Vedanta Limited', 'Corporate', 'India'),
(49, 'JSW Steel', 'Corporate', 'India'),
(50, 'Dr Reddys Laboratories', 'Corporate', 'India');

INSERT INTO Dim_Cargo VALUES

(1, 'Electronics', 'High Value'),
(2, 'Food Products', 'Perishable'),
(3, 'Chemicals', 'Hazardous'),
(4, 'Furniture', 'General'),
(5, 'Clothing & Textiles', 'General'),
(6, 'Pharmaceuticals', 'High Value'),
(7, 'Automobile Parts', 'Industrial'),
(8, 'Machinery', 'Industrial'),
(9, 'Oil & Gas', 'Hazardous'),
(10, 'Metals', 'Industrial'),
(11, 'Agricultural Products', 'Perishable'),
(12, 'Luxury Goods', 'High Value'),
(13, 'Paper & Packaging', 'General'),
(14, 'Construction Materials', 'Industrial'),
(15, 'Plastics', 'Industrial');

INSERT INTO Dim_Crew VALUES

(1, 'Raj Sharma', 'Captain', 15, 'India'),
(2, 'Amit Verma', 'Engineer', 10, 'India'),
(3, 'Ali Khan', 'Engineer', 8, 'UAE'),
(4, 'John Smith', 'Officer', 7, 'USA'),
(5, 'David Lee', 'Captain', 18, 'Singapore'),
(6, 'Michael Brown', 'Officer', 9, 'UK'),
(7, 'Chen Wei', 'Engineer', 11, 'China'),
(8, 'Hiroshi Tanaka', 'Captain', 20, 'Japan'),
(9, 'Carlos Gomez', 'Staff', 5, 'Spain'),
(10, 'Ahmed Hassan', 'Officer', 6, 'Egypt'),
(11, 'Ravi Patel', 'Staff', 4, 'India'),
(12, 'Suresh Nair', 'Engineer', 12, 'India'),
(13, 'James Wilson', 'Captain', 17, 'USA'),
(14, 'Robert King', 'Officer', 8, 'Canada'),
(15, 'Daniel Kim', 'Engineer', 9, 'South Korea'),
(16, 'Luis Fernandez', 'Staff', 6, 'Mexico'),
(17, 'Omar Farooq', 'Engineer', 10, 'Saudi Arabia'),
(18, 'Thomas Muller', 'Captain', 19, 'Germany'),
(19, 'Pierre Dubois', 'Officer', 11, 'France'),
(20, 'Marco Rossi', 'Staff', 7, 'Italy'),
(21, 'Arjun Mehta', 'Engineer', 8, 'India'),
(22, 'Vikram Singh', 'Captain', 16, 'India'),
(23, 'Naveen Kumar', 'Officer', 6, 'India'),
(24, 'Rahul Das', 'Staff', 3, 'India'),
(25, 'Jason Clark', 'Engineer', 9, 'USA'),
(26, 'Andrew Scott', 'Officer', 10, 'UK'),
(27, 'Steven Adams', 'Captain', 18, 'Australia'),
(28, 'George Baker', 'Engineer', 7, 'USA'),
(29, 'Kevin White', 'Staff', 5, 'Canada'),
(30, 'Chris Evans', 'Officer', 8, 'USA'),
(31, 'Mohammed Ali', 'Engineer', 11, 'UAE'),
(32, 'Yusuf Khan', 'Staff', 4, 'India'),
(33, 'Zhang Wei', 'Officer', 9, 'China'),
(34, 'Lee Min Ho', 'Engineer', 10, 'South Korea'),
(35, 'Kenji Sato', 'Captain', 21, 'Japan'),
(36, 'Fernando Silva', 'Staff', 6, 'Brazil'),
(37, 'Ivan Petrov', 'Engineer', 12, 'Russia'),
(38, 'Sergey Ivanov', 'Officer', 11, 'Russia'),
(39, 'Ahmed Raza', 'Staff', 5, 'Pakistan'),
(40, 'Fatima Noor', 'Officer', 7, 'UAE');

SHOW VARIABLES LIKE 'cte_max_recursion_depth';
SET SESSION cte_max_recursion_depth = 2000;

-- Date
INSERT INTO Dim_Date
WITH RECURSIVE dates AS (
    SELECT DATE('2021-01-01') AS dt
    UNION ALL
    SELECT DATE_ADD(dt, INTERVAL 1 DAY)
    FROM dates
    WHERE dt < '2025-12-31'
)
SELECT 
    DATE_FORMAT(dt, '%Y%m%d') + 0,
    dt,
    YEAR(dt),
    QUARTER(dt),
    MONTH(dt),
    MONTHNAME(dt),
    DAY(dt)
FROM dates;

SET SESSION cte_max_recursion_depth = 6000;

-- Facct shipping
INSERT INTO Fact_Shipments (
    shipment_id, customer_id, ship_id, cargo_id,
    origin_port_id, destination_port_id,
    shipment_date_id, delivery_date_id,
    weight, expected_delivery_days, actual_delivery_days, delay_days
)

WITH RECURSIVE row_generator AS (
    SELECT 1 AS id
    UNION ALL
    SELECT id + 1 FROM row_generator WHERE id < 5000
)

SELECT 
    ROW_NUMBER() OVER () AS shipment_id,  

    FLOOR(1 + RAND()*50),

    ship_id,

    CASE 
        WHEN ship_type = 'Container' THEN FLOOR(1 + RAND()*5)
        WHEN ship_type = 'Bulk Carrier' THEN FLOOR(7 + RAND()*4)
        WHEN ship_type = 'Tanker' THEN 
            CASE 
                WHEN RAND() < 0.5 THEN 3
                ELSE 9
            END
    END,

    origin_port,
    destination_port,

    ship_date,

    DATE_FORMAT(
        DATE_ADD(STR_TO_DATE(ship_date, '%Y%m%d'), INTERVAL actual_days DAY),
        '%Y%m%d'
    ) + 0,

    CASE 
        WHEN ship_type = 'Container' THEN ROUND(1000 + RAND()*4000, 2)
        WHEN ship_type = 'Bulk Carrier' THEN ROUND(5000 + RAND()*10000, 2)
        WHEN ship_type = 'Tanker' THEN ROUND(8000 + RAND()*12000, 2)
    END,

    expected_days,
    actual_days,

    GREATEST(0, actual_days - expected_days)

FROM (
    SELECT 
        r.id,
        s.ship_id,
        s.ship_type,

        FLOOR(1 + RAND()*55) AS origin_port,
        FLOOR(1 + RAND()*55) AS destination_port,

        DATE_FORMAT(
            DATE_ADD('2021-01-01', INTERVAL FLOOR(RAND()*1200) DAY),
            '%Y%m%d'
        ) + 0 AS ship_date,

        10 + FLOOR(RAND()*5) AS expected_days,
        10 + FLOOR(RAND()*15) AS actual_days

    FROM row_generator r
    JOIN Dim_Ships s 
        ON s.ship_id = FLOOR(1 + RAND()*34)
) t

WHERE origin_port != destination_port;


-- Fact Sales

INSERT INTO Fact_Sales (
    sales_id, shipment_id, customer_id, sales_date_id, 
    shipping_cost, revenue, profit, discount
)
WITH BaseData AS (
    SELECT 
        f.shipment_id,
        f.customer_id,
        f.shipment_date_id,
        f.weight,
        f.delay_days,
        s.ship_type,
        -- Calculate Cost
        (f.weight * (2 + RAND()*3)) AS cost,
        -- Generate random base profit factor
        (1000000 + RAND()*500000) AS base_profit_seed
    FROM Fact_Shipments f
    JOIN Dim_Ships s ON f.ship_id = s.ship_id
),
FinalCalculations AS (
    SELECT 
        *,
        -- 🎯 Calculate Final Profit once to use in multiple columns
        LEAST(
            1500000,
            GREATEST(
                1000000,
                base_profit_seed
                + CASE 
                    WHEN ship_type = 'Tanker' THEN 200000
                    WHEN ship_type = 'Bulk Carrier' THEN 100000
                    ELSE 0
                  END
                - (delay_days * 20000)
            )
        ) AS final_profit
    FROM BaseData
)
SELECT 
    ROW_NUMBER() OVER () AS sales_id,
    shipment_id,
    customer_id,
    shipment_date_id,
    ROUND(cost, 2) AS shipping_cost,           -- Position 5: shipping_cost
    ROUND(cost + final_profit, 2) AS revenue,  -- Position 6: revenue (Now Correct)
    ROUND(final_profit, 2) AS profit,          -- Position 7: profit (Now Correct)
    ROUND(RAND()*10000, 2) AS discount         -- Position 8: discount
FROM FinalCalculations;

select * from fact_sales;

-- Bridge Crew

INSERT INTO Bridge_Shipment_Crew (shipment_id, crew_id)
WITH ShipmentDelayRank AS (
    -- Rank shipments by delay: 1 = most delayed
    SELECT 
        shipment_id, 
        delay_days,
        PERCENT_RANK() OVER (ORDER BY delay_days DESC) as delay_percentile
    FROM Fact_Shipments
),
CaptainRoles AS (
    -- Split Captains into two groups
    SELECT 
        crew_id,
        CASE 
            WHEN crew_id IN (1, 5, 8) THEN 'Delay_Prone' -- Specific Captains
            ELSE 'Standard' 
        END AS captain_type
    FROM Dim_Crew
    WHERE role = 'Captain'
)

-- 1. Assign "Delay-Prone" Captains to the top 30% most delayed shipments
SELECT shipment_id, crew_id FROM (
    SELECT s.shipment_id, c.crew_id,
           ROW_NUMBER() OVER(PARTITION BY s.shipment_id ORDER BY RAND()) as rn
    FROM ShipmentDelayRank s
    CROSS JOIN CaptainRoles c
    WHERE s.delay_percentile <= 0.3 AND c.captain_type = 'Delay_Prone'
) t1 WHERE rn = 1

UNION ALL

-- 2. Assign Standard Captains to the rest of the shipments
SELECT shipment_id, crew_id FROM (
    SELECT s.shipment_id, c.crew_id,
           ROW_NUMBER() OVER(PARTITION BY s.shipment_id ORDER BY RAND()) as rn
    FROM ShipmentDelayRank s
    CROSS JOIN CaptainRoles c
    WHERE s.delay_percentile > 0.3 AND c.captain_type = 'Standard'
) t2 WHERE rn = 1

UNION ALL

-- 3. Assign 1 Engineer to every shipment (Randomly)
SELECT shipment_id, crew_id FROM (
    SELECT s.shipment_id, c.crew_id,
           ROW_NUMBER() OVER(PARTITION BY s.shipment_id ORDER BY RAND()) as rn
    FROM Fact_Shipments s
    CROSS JOIN Dim_Crew c
    WHERE c.role = 'Engineer'
) t3 WHERE rn = 1

UNION ALL

-- 4. Assign 1 Officer/Staff to every shipment (Randomly)
SELECT shipment_id, crew_id FROM (
    SELECT s.shipment_id, c.crew_id,
           ROW_NUMBER() OVER(PARTITION BY s.shipment_id ORDER BY RAND()) as rn
    FROM Fact_Shipments s
    CROSS JOIN Dim_Crew c
    WHERE c.role NOT IN ('Captain', 'Engineer')
) t4 WHERE rn = 1;

select * from Bridge_Shipment_Crew;
