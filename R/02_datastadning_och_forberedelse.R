library(here)
source(here("R", "01_dataforstaelse.R"))
df_raw
unique(df_raw$city)

unique(df_raw$payment_method)

unique(df_raw$campaign_source)

# Datastädning

df_clean <- df_raw %>%
  mutate(
    city = str_trim(city),
    city = str_to_title(city),
    payment_method = str_trim(payment_method),
    payment_method = str_to_title(payment_method),
    campaign_source = str_trim(campaign_source),
    campaign_source = str_to_title(campaign_source),
    campaign_source = str_replace_all(campaign_source, "Social Media", "Social"),
    order_date = as.Date(order_date),
    returned = recode(returned, "Yes" = TRUE, "No" = FALSE, .default = NA)
  )

glimpse(df_clean)
summary(df_clean)
unique(df_clean$city)
unique(df_clean$payment_method)
unique(df_clean$campaign_source)
length(unique(df_clean$customer_id))
length(unique(df_clean$order_id))
unique(df_clean$customer_segment)

# Saknade värden:
# kategoriska variabler ersätts med "Unknown"
# numeriska variabler ersätts med medianen

df_clean <- df_clean %>%
  mutate(
    city = if_else(is.na(city), "Unknown", city),
    payment_method = if_else(is.na(payment_method), "Unknown", payment_method),
    campaign_source = if_else(is.na(campaign_source), "Unknown", campaign_source),
    discount_pct = if_else(is.na(discount_pct), 
                           median(discount_pct, na.rm = TRUE), 
                           discount_pct),
    shipping_days = if_else(is.na(shipping_days), 
                            median(shipping_days, na.rm = TRUE), 
                            shipping_days),
    city = as.factor(city),
    customer_segment = as.factor(customer_segment),
    customer_type = as.factor(customer_type),
    region = as.factor(region),
    product_category = as.factor(product_category),
    product_subcategory = as.factor(product_subcategory),
    payment_method = as.factor(payment_method),
    campaign_source = as.factor(campaign_source)
  )

colSums(is.na(df_clean))

# 2 nya variabler: ordervärde och orderstorlek

df_clean <- df_clean %>%
   mutate(
    order_value = quantity * unit_price * (1 - discount_pct),
    order_size = case_when(
      order_value < 100 ~ "Low",
      order_value < 300 ~ "Medium",
      TRUE ~ "High"),
    order_size = factor(order_size, levels = c("Low", "Medium", "High"))
    )

glimpse(df_clean)
