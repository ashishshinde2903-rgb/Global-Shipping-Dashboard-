# Global-Shipping-Dashboard
1.Summary 📋

A Power BI dashboard analyzing global shipping logistics to uncover insights on shipment performance, delays, route efficiency, and profitability.

2.Overview 📝

This project analyzes global shipping operations over a 5-year period (2021–2025). It focuses on understanding shipment trends, operational efficiency, route performance, financial outcomes, and crew productivity using an interactive Power BI dashboard.

3.Problem ⚠️

Shipping operations involve multiple factors such as routes, ship types, delays, and crew performance, which directly impact delivery efficiency and profitability. The challenge is to identify inefficiencies, reduce delays, and optimize operations using data-driven insights.

4.Dataset 📊

The dataset consists of 5000+ synthetic shipping records including shipment details, ports, ships, cargo, customers, crew, and financial data (revenue, cost, profit). The data spans across multiple countries and ship types such as container, bulk carrier, and tanker.

5.Tools and Technologies ⚙️

- SQL (MySQL) – Data generation and modeling
- Power BI – Data visualization and dashboard creation
- DAX – Measures and calculated columns
- Data Modeling – Star schema with fact and dimension tables

6.Methods 🧩

- Designed a star schema data model with fact and dimension tables
- Created bridge table for crew-to-shipment relationship (many-to-many)
- Generated realistic synthetic data using SQL
- Built DAX measures for KPIs like revenue, profit, delay, and efficiency
- Developed interactive dashboards with slicers and filters

7.Key Insights 📈

- Tanker ships generate the highest profit among all ship types
- Delays have a direct negative impact on profitability
- Certain routes contribute significantly to overall shipment volume and revenue
- High-performing crew members manage more shipments with lower delays
- Seasonal trends affect shipment volume over time

8.Dashboard / Model / Output 📊📉

The project includes multiple dashboard pages:
- Executive Summary (Overview of KPIs and trends)
- Shipment Analysis (Volume, delay, and distribution)
- Financial Analysis (Revenue, cost, and profit insights)
- Route Analysis (Top routes and efficiency)
- Crew Analysis (Performance and workload)

The data model follows a star schema with fact tables (Shipments, Sales) and dimension tables (Ports, Ships, Cargo, Customers, Crew, Date).

9.How to Run this Project 🗂️

1. Clone or download this repository
2. Set up the MySQL database and run the SQL scripts from the `sql/` folder to create tables and generate data
3. Open the Power BI file (`pbix/shipping_dashboard.pbix`)
4. Update the data source connection (if required)
5. Click on **Refresh** to load the data
6. Explore the dashboard using slicers and filters

10.Results & Conclusion 🎯
The project successfully demonstrates how data visualization and modeling can be used to analyze shipping operations. It highlights key performance drivers, identifies inefficiencies, and provides actionable insights to improve delivery performance and profitability.

## Snapshots of Project
<br>

### 1.Summary
<img width="2505" height="1407" alt="Summary" src="https://github.com/user-attachments/assets/7a3a04c0-cc69-4456-b58c-62b204583793" />

### 2.Overview
<img width="2507" height="1410" alt="Overview" src="https://github.com/user-attachments/assets/1df0025f-b257-4408-9b16-03927c1c327a" />

### 3.Finance Analyse
<img width="2507" height="1410" alt="Finance Analyse" src="https://github.com/user-attachments/assets/53fdc360-653b-43b8-b552-5d4ff8185b84" />

### 4.Crew Analyse
<img width="2507" height="1391" alt="Crew Analyse" src="https://github.com/user-attachments/assets/bceeee75-216d-4060-92c1-14c1b5a1e0e4" />

### 5.Shipment Analysis
<img width="2507" height="1406" alt="Shipment Analysis" src="https://github.com/user-attachments/assets/15e5c66e-e42d-4659-8345-b1aa63224496" />

### 6.Route Analysis
<img width="2507" height="1389" alt="Route Analysis" src="https://github.com/user-attachments/assets/c549a561-0a28-4ddd-b8b4-bc18e37c9e3c" />




