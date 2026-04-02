library(tidyverse)

df <- read_csv("data/ecommerce_orders.csv")

dim(df)
names(df)
glimpse(df)
colSums(is.na(df))
head(df, 10)