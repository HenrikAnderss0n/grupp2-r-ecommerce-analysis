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



