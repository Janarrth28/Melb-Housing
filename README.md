# Melbourne Housing Market Analysis

![R](https://img.shields.io/badge/R-Data%20Analysis-blue)
![Tableau](https://img.shields.io/badge/Tableau-Data%20Visualization-orange)
![Status](https://img.shields.io/badge/Project-Completed-success)
![License](https://img.shields.io/badge/License-MIT-lightgrey)

---

## Project Overview

This project analyses residential property transactions in Melbourne to identify the key factors influencing housing prices. The analysis transforms raw housing data into actionable insights using **R for data preparation** and **Tableau for interactive visualisation**.

The project demonstrates a complete **data analytics workflow**, including data cleaning, feature engineering, exploratory data analysis, and dashboard development.

The insights generated from this analysis can help **home buyers, real estate professionals, and property investors** better understand the housing market and identify good-value property opportunities.

---

## Business Problem

New home buyers and property investors often struggle to determine which housing characteristics significantly influence property prices.

This project addresses the following key question:

**What are the main factors that determine house prices in Melbourne, and how can data-driven insights support stakeholders in identifying good-value properties?**

---

## Project Objectives

The objectives of this project are to:

- Clean and preprocess the Melbourne housing dataset
- Perform exploratory data analysis to understand market patterns
- Engineer additional features to improve interpretability
- Identify the key drivers of housing prices
- Build an interactive Tableau dashboard for stakeholder exploration
- Communicate insights through clear visualisations and documentation

---

## Tools and Technologies

| Tool | Purpose |
|-----|------|
| **R** | Data cleaning and preprocessing |
| **tidyverse** | Data manipulation and transformation |
| **lubridate** | Date processing |
| **Tableau** | Interactive dashboard development |
| **GitHub** | Project documentation and version control |

---

## Dataset Description

The dataset contains historical housing sales information from Melbourne, including attributes such as:

- Property price
- Number of rooms
- Property type
- Distance from Melbourne CBD
- Region and suburb
- Land size
- Building area
- Year built
- Sale date

The dataset primarily covers property transactions between **2016 and 2017**.

---

## Data Preparation and Cleaning

Data cleaning and transformation were performed in **R** to ensure the dataset was structured and suitable for analysis.

### Handling Missing Values

Missing values were examined across all variables. Instead of removing observations with missing building area values, an indicator variable was created:

- **BuildingArea_missing** → identifies properties where building size information is unavailable

This preserves the dataset while capturing potentially useful information.

---

### Date Transformation

The `Date` variable was converted into a proper date format using the **lubridate** package.

Additional time variables were extracted:

- **SaleYear**
- **SaleMonth**

These features enable time-based analysis and trend exploration.

---

### Outlier Treatment

Extreme price values were capped at the **99th percentile** to reduce distortion caused by luxury property outliers.

This ensures that the analysis reflects general market trends rather than extreme high-end properties.

---

### Feature Engineering

Several new variables were created to enhance analytical insights:

- **Price_per_room** – measures property value relative to the number of rooms
- **Price_per_sqm** – measures land value efficiency
- **Property_age** – calculates the age of the property at the time of sale
- **Distance_bucket** – categorises properties based on distance from the CBD
- **YearBuilt_group** – groups properties into construction eras

These engineered features help reveal meaningful patterns in housing prices.

---

### Standardisation of Categorical Variables

To improve readability and consistency:

- Property types were recoded from abbreviated codes (`h`, `u`, `t`) to full labels (`House`, `Unit`, `Townhouse`)
- Suburb names were cleaned to remove unnecessary whitespace

This ensures accurate grouping and analysis.

---

## Exploratory Data Analysis

Several visualisations were created to explore key housing market patterns.

### Price Distribution

A histogram was used to understand the distribution of property prices and identify skewness in the housing market.

---

### Property Type vs Price

Boxplots were used to compare price distributions across property types, including houses, units, and townhouses.

---

### Distance from CBD vs Price

A scatter plot with a trend line was used to analyse how distance from the Melbourne CBD influences property prices.

---

### Median Price by Region

A bar chart was created to compare median housing prices across different Melbourne regions.

---

### Price per Square Metre by Region

This analysis identifies which regions have the highest land value based on price per square metre.

---

### Price by Number of Rooms

Boxplots were used to analyse how property size influences price.  
Properties with more than six rooms were excluded to avoid distortion from extreme values.

---

## Tableau Dashboard

An interactive **Tableau dashboard** was developed to enable stakeholders to explore the housing market dynamically.

The dashboard highlights:

- Housing price distribution
- Property type comparisons
- Distance vs price relationship
- Regional housing price differences
- Price per square metre analysis

Interactive filters allow users to explore housing trends based on:

- Property type
- Region
- Distance from CBD
- Construction era
- Sale year

---

## Dashboard Preview

![image alt](https://github.com/Janarrth28/Melb-Housing/blob/921fc441908d3a07c023c8a6a63af5a9dd3d85f8/dashboard_preview.png)


## Author

**Janarrth Srikanth**

Bachelor of Computer Science (Data Science)

This project demonstrates skills in:

- Data cleaning and preprocessing
- Feature engineering
- Exploratory data analysis
- Data visualisation
- Business insight generation
- Dashboard development

---

## License

This project is open-source and available under the **MIT License**.

