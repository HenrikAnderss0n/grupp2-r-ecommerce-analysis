library(here)
library(tidyverse)

df_raw <- read_csv("data/ecommerce_orders.csv")

dim(df_raw)
names(df_raw)
glimpse(df_raw)
colSums(is.na(df_raw))
head(df_raw, 10)

