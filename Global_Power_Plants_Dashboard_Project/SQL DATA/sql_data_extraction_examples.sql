-- SQL Data Extraction Examples for Global Power Plants Dashboard Project
--
-- This script demonstrates example SQL SELECT queries that could be used to extract
-- the raw data from a relational database, serving as the initial data source
-- for the Power BI dashboard.
--
-- IMPORTANT NOTE
-- For this specific Power BI project, detailed data cleaning and transformation
-- (such as handling '--' values, trimming whitespace, and type conversions)
-- were primarily performed within Power BI's Power Query Editor using M language,
-- rather than through complex SQL UPDATEALTER statements.
-- This script focuses on the initial data retrieval aspect.

-- Replace 'YourDatabaseName' and 'YourSchemaName' with your actual database and schema names.

USE YourDatabaseName;
GO -- 'GO' is for SQL Server; remove if using MySQLPostgreSQL

--------------------------------------------------------------------------------
-- 1. Raw Data Extraction Power Plants Table
--    This query retrieves the foundational data for individual power plants.
--------------------------------------------------------------------------------
SELECT
    pp.plant_id,            -- Unique identifier for the power plant
    pp.plant_name,          -- Name of the power plant
    pp.capacity_mw,         -- Installed capacity in megawatts (MW)
    pp.primary_fuel,        -- Main fuel type (e.g., Coal, Hydro, Solar)
    pp.commissioning_year,  -- Year the plant began operations
    pp.country_code_alpha_3 -- Alpha-3 code for the country (for joining with country dimension)
FROM
    YourSchemaName.Raw_PowerPlants_Table pp;
GO

--------------------------------------------------------------------------------
-- 2. Raw Data Extraction Country Dimension Table
--    This query retrieves the geographical and categorical details for countries,
--    to be used as a lookup (dimension) table in Power BI.
--------------------------------------------------------------------------------
SELECT
    dc.alpha_3_code,        -- Unique Alpha-3 country code (primary key for join)
    dc.country_full_name,   -- Full name of the country
    dc.region_name,         -- Broader geographical region (e.g., Asia, Europe)
    dc.sub_region_name      -- More granular sub-region (e.g., South Asia, Western Europe)
FROM
    YourSchemaName.Raw_CountryDimension_Table dc;
GO

-- End of SQL Extraction Examples