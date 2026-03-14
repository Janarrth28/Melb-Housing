library(tidyverse)
library(lubridate)

df <- read_csv("melb_data.csv")
head(df)
glimpse(df)

colSums(is.na(df)) #counts the number of missing values for each column

# Treating missing values 
df <- df %>%
  mutate(BuildingArea_missing = is.na(BuildingArea))

# Categorizing the built year into different time periods 
df <- df %>% 
  mutate(
    YearBuilt_group = case_when(
      YearBuilt < 1950 ~ 'Pre-1950',
      YearBuilt >= 1950 & YearBuilt < 2000 ~ "1950-1999",
      YearBuilt >= 2000 ~ "2000+",
      TRUE ~ "Unknown"
    )
  )

#Changing date from character format to proper Date format
df <- df %>% 
  mutate(Date = dmy(Date))

# Creating columns with the years and months of the sale separately to make trends 
df <- df %>% 
  mutate(
    SaleYear = year(Date),
    SaleMonth = month(Date)
  )

summary(df$Price)

# cutting off extreme prices to keep it fair for the general market
price_cap <- quantile(df$Price, 0.99, na.rm = TRUE)

df <- df %>% 
  filter(Price <= price_cap)

# Creating important columns which will be useful for important insights

# price per room
df <- df %>% 
  mutate(Price_per_room = Price / Rooms)

#price per square meter 
df <- df %>% 
  mutate(Price_per_sqm = Price / Landsize)

#property age during the sale
df <- df %>% 
  mutate(Property_age = SaleYear - YearBuilt)

# Distance from CBD categories
df <- df %>% 
  mutate(
    Distance_bucket = cut(
      Distance,
      breaks = c(0, 5, 10, 20, 50),
      labels = c("0–5km", "5–10km", "10–20km", "20km+"),
      include.lowest = TRUE
    )
  )


# Standardizing categorical values
df <- df %>% 
  mutate(
    Type = recode(Type,
                  "h" = "House",
                  "u" = "Unit",
                  "t" = "Townhouse")
  )

df <- df %>% 
  mutate(Suburb = str_trim(Suburb))




#PLOTS


#price distribution - histogram 

ggplot(df,aes(x = Price)) + 
  geom_histogram(binwidth = 50000, fill = "steelblue", colour = "white") +
  scale_x_continuous(labels = scales::comma) + 
  labs(
    title = "DISTRIBUTION OF MELBOURNE HOUSE PRICES",
    x = "Property Prices (AUD)",
    y = "Number of Properties"
  ) + 
  theme_minimal()



#property type vs price

ggplot(df, aes(x = Type, y = Price)) +
  geom_boxplot(fill = "lightblue") +
  scale_y_continuous(labels = scales::comma) +
  labs(
    title = "Property Prices by Type",
    x = "Property Type",
    y = "Price (AUD)"
  ) +
  theme_minimal()


#distance from CBD vs price

ggplot(df, aes(x = Distance, y = Price)) +
  geom_point(alpha = 0.4, color = "darkblue") +
  geom_smooth(method = "loess", se = FALSE, color = "red") +
  scale_y_continuous(labels = scales::comma) +
  labs(
    title = "Property Price vs Distance from CBD",
    x = "Distance from CBD (km)",
    y = "Price (AUD)"
  ) +
  theme_minimal()


#Median Price by Region 

df %>%
  group_by(Regionname) %>%
  summarise(Median_Price = median(Price, na.rm = TRUE)) %>%
  ggplot(aes(x = reorder(Regionname, Median_Price), y = Median_Price)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  scale_y_continuous(labels = scales::comma) +
  labs(
    title = "Median Property Price by Region",
    x = "Region",
    y = "Median Price (AUD)"
  ) +
  theme_minimal()


#Price per sq.meter by Region

df %>%
  filter(!is.na(Price_per_sqm)) %>%
  group_by(Regionname) %>%
  summarise(Median_Price_per_sqm = median(Price_per_sqm)) %>%
  ggplot(aes(x = reorder(Regionname, Median_Price_per_sqm),
             y = Median_Price_per_sqm)) +
  geom_col(fill = "purple") +
  coord_flip() +
  labs(
    title = "Median Price per Square Metre by Region",
    x = "Region",
    y = "Price per sqm (AUD)"
  ) +
  theme_minimal()


#Price by Number of Rooms

df %>%
  filter(Rooms <= 6) %>%
  ggplot(aes(x = factor(Rooms), y = Price)) +
  geom_boxplot(fill = "lightgreen") +
  scale_y_continuous(labels = scales::comma) +
  labs(
    title = "Property Price by Number of Rooms (Up to 6 Rooms)",
    x = "Number of Rooms",
    y = "Price (AUD)"
  ) +
  theme_minimal()




install.packages("openxlsx")
library(openxlsx)
write.xlsx(df, "melb_data_updated.xlsx", rowNames = FALSE)






