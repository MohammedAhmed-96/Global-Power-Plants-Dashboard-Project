# Data Files & SQL Context

This folder contains the **cleaned data files** used as input for the "Global Power Plants Dashboard" Power BI project, along with conceptual SQL queries that demonstrate how such data might be extracted from a relational database.

## Data Files
The following **cleaned CSV files** serve as the direct input for the Power BI report. These files represent data that has already undergone an initial cleaning process prior to being used in Power BI Desktop.

-   `cleaned_power_plants.csv`: Contains the cleaned and structured data for individual power plant records (e.g., name, capacity, fuel type, commissioning year, country code).
-   `cleaned_dim_country.csv`: Provides the cleaned country and regional attributes (e.g., full country name, alpha-3 code, region, sub-region).

*Note: The subsequent data transformation steps (e.g., handling specific inconsistencies like '--' in regions, type conversions, whitespace trimming) were performed within Power BI's Power Query Editor, building upon these pre-cleaned inputs.*

## SQL Context & Example Queries
To showcase foundational database knowledge and how such datasets are often sourced, this section provides example SQL `SELECT` queries. These queries illustrate how raw power plant and country dimension data *could be initially extracted* from a hypothetical relational database.

---

### **1. Example: Extracting Raw Power Plant Data**

```sql
SELECT
    plant_id,            -- Unique identifier for the power plant
    plant_name,          -- Name of the power plant
    capacity_mw,         -- Installed capacity in megawatts (MW)
    primary_fuel,        -- Main fuel type (e.g., Coal, Hydro, Solar)
    commissioning_year,  -- Year the plant began operations
    country_code_alpha_3 -- Alpha-3 code for the country (for joining)
FROM
    [YourDatabaseName].[YourSchemaName].[Raw_PowerPlants_Table];