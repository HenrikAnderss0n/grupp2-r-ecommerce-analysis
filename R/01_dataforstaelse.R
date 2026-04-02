library(tidyverse)

# Läser in data
df <- read_csv("data/ecommerce_orders.csv")

# Datasetets storlek
nrow(df)
ncol(df)

# Variabler i datasetet
names(df)

# Överblick av variabeltyper
glimpse(df)

# Saknade värden
colSums(is.na(df))

# De första 10 raderna
head(df, 10)

# För vår analys verkar customer_segment, customer_type, product_category,
# quantity, unit_price, discount_pct, shipping_days och returned vara viktigast.
# Vi ser också att vissa variabler har saknade värden som behöver hanteras i nästa steg.


