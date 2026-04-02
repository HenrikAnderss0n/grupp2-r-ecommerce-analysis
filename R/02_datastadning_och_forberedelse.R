unique(df$city)

unique(df$payment_method)

unique(df$campaign_source)

# Datastädning

df_clean <- df %>%
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
                           discount_pct, 
                           missing = median(discount_pct, na.rm = TRUE)),
    shipping_days = if_else(is.na(shipping_days), 
                            median(shipping_days, na.rm = TRUE), 
                            shipping_days, 
                            missing = median(shipping_days, na.rm = TRUE))
  )

colSums(is.na(df_clean))

# 2 nya variabler: ordervärde och leveranskategori

df_clean <- df_clean %>%
  mutate(order_value = quantity * unit_price * (1 - discount_pct),
         shipping_category = case_when(
           shipping_days <= 3 ~ "Fast",
           shipping_days <= 5 ~ "Medium",
           TRUE ~ "Long"
         ))

glimpse(df_clean)
