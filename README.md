# Global Power Plant Analysis Dashboard

## Project Overview
This project features an interactive Power BI dashboard designed to analyze global power plant data. It provides key insights into total capacity, primary fuel type distribution, historical commissioning trends, and geographical distribution of power plants worldwide. This dashboard was developed using Power BI Desktop, with data preparation and modeling primarily handled by Power Query from pre-cleaned CSV datasets.

## Key Features & Insights
-   **Total Power Plants & Capacity:** Quick summary cards displaying the total number of power plants and their aggregate capacity in megawatts (MW) globally.
-   **Average Plant Capacity:** An insight into the typical size of power plants.
-   **Fuel Type Analysis:** Visualizations (Bar Chart and Donut Chart) showing the distribution of power capacity by primary fuel types (e.g., Coal, Hydro, Solar, Nuclear, Wind), including their percentage contribution to the grand total.
-   **Commissioning Trends:** A line chart illustrating the annual trends in commissioned power capacity over the years, highlighting periods of significant growth or change.
-   **Geographical Distribution:** An interactive map displaying the locations of power plants globally, filterable by region and sub-region.
-   **Interactive Filtering:** Slicers for `Primary Fuel`, `Region`, and `Sub-Region` allow users to dynamically filter all visuals on the dashboard.

## Data Source & Preparation
The input data for this Power BI project consists of **pre-cleaned CSV files**:
-   `cleaned_power_plants.csv`: Contains individual power plant records with relevant details.
-   `cleaned_dim_country.csv`: Provides country and regional attributes for joining.

These CSV files represent data that has already undergone an initial cleaning process. Further transformations, refinements, and data modeling for the dashboard were performed within **Power BI Desktop's Power Query Editor** (M language).

### Power Query (M Language) Transformations:
Key Power Query steps applied to these cleaned CSVs within Power BI include:
1.  **Connecting to Data:** Established connections to the `cleaned_power_plants.csv` and `cleaned_dim_country.csv` files.
2.  **Data Type Adjustments:** Ensured `capacity_mw` was precisely set to a Decimal Number, and `commissioning_year` to a Whole Number. Other columns were set to appropriate text or numeric types.
3.  **Whitespace Trimming:** Applied `TRIM()` transformations to relevant text columns (e.g., `name`, `primary_fuel`, `country_full_name`, `region`, `sub_region`) to remove any leading or trailing spaces, ensuring data consistency for joins and filters.
4.  **Handling Inconsistent 'Region' Values:** A custom column was created to transform problematic `region` entries (specifically the `"--"` string, empty strings, and existing nulls) in the `dim_country` table into unified `null` values. This was done using the following M language logic:
    ```powerquery-m
    if [region] = "--" then null
    else if [region] = "" then null
    else if [region] = null then null
    else [region]
    ```
    The original `region` column was then replaced by this new, cleaned version.
5.  **Filtering Nulls:** Rows containing `null` values in the cleaned `region` column were filtered out to remove unclassified countries from the dashboard's analysis and slicers.

## Power BI Report Development
The interactive dashboard was built using **Power BI Desktop**, leveraging its powerful features:
-   **DAX Measures:** Custom Data Analysis Expressions (DAX) were written to derive key performance indicators and analytical insights, including:
    -   `Total Power Plants`, `Total Capacity (MW)`, `Average Capacity (MW)`
    -   `Capacity % of Grand Total`, `Plants % of Grand Total`
-   **Data Modeling:** A robust star schema model was established, creating a `Many-to-One` relationship between the `power_plants` (fact) table and the `dim_country` (dimension) table using the appropriate country code columns. All DAX measures are organized in a dedicated `_Measures` table for clarity.
-   **Visualizations & Layout:** A diverse set of visuals (Cards, Bar Chart, Donut Chart, Map, Line Chart) were employed. The dashboard is designed on a single cohesive "Overview" page for a clear and intuitive user experience.

## How to Explore the Report
-   **Interactive Version:** Download the `Global_Power_Plants_Report.pbix` file from the `_PowerBI_Report` folder. You can open this file using Power BI Desktop to interact with the full dashboard.
-   **Static PDF View:** For a quick, non-interactive overview of the dashboard's design and content, view the `Global_Power_Plants_Report.pdf` located in the `_Exports` folder.

## Dashboard Snapshots
Here is a visual preview of the dashboard's main page:

### Overview Page
![Overview Page Snapshot](Snapshots/Global_Power_Plants_Overview.png)

## Files in this Repository
-   `README.md`: This file, providing a comprehensive overview of the project.
-   `_Data/`: Contains the cleaned CSV data and example SQL queries.
-   `_PowerBI_Report/`: Contains the Power BI Desktop file (`.pbix`).
-   `_Exports/`: Contains the PDF export of the report.
-   `_Snapshots/`: Contains screenshots of the dashboard pages.

---
*This project was developed as part of a guided learning experience in data analysis and visualization.*
