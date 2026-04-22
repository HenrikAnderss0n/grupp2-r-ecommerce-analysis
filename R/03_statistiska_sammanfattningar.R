library(tidyverse)

# 1.Vilka produktkategorier verkar driva högst försäljning? 

sales_by_category <- df_clean %>% 
  group_by(product_category) %>% 
  summarise(
    avg_order = mean(order_value, na.rm = TRUE),
    median_order = median(order_value, na.rm = TRUE),
    total_sales = sum(order_value, na.rm = TRUE),
    orders = n(),
    .groups = "drop"
  ) %>% 
  arrange(desc(total_sales))

print(sales_by_category)

# Resultat:
# Electronics har högst total försäljning (155500), följt av Home och Sports.



# 2.Hur skiljer sig ordervärde mellan olika kundsegment?

sales_by_segment <- df_clean %>% 
  group_by(customer_segment) %>% 
  summarise(
    avg_order = mean(order_value, na.rm = TRUE),
    median_order = median(order_value, na.rm = TRUE),
    total_sales = sum(order_value, na.rm = TRUE),
    orders = n(),
    .groups = "drop"
  ) %>% 
  arrange(desc(total_sales))


sales_by_segment_size <- df_clean %>%
  group_by(customer_segment, order_size) %>%
  summarise(
    orders = n(),
    .groups = "drop"
  )

print(sales_by_segment)
print(sales_by_segment_size)


# Resultat:
# Consumer genererar mest total försäljning (170338),
# medan Small Business spenderar mest per köp (346).
# Corporate bidrar minst både i antal ordrar (169) och total försäljning (39744).

# När vi analyserar orderstorlek (Low <100, Medium 100–300, High >300), ser vi att 
# Consumer gör flest köp i alla orderstorlekar (Low, Medium och High).
# Small Business gör relativt många större köp i Medium och High,
# medan Corporate har minst antal ordrar i alla orderstorlekar.



# 3.Hur skiljer sig försäljning mellan olika regioner?

sales_by_region <- df_clean %>% 
  group_by(region) %>% 
  summarise(
    total_sales = sum(order_value, na.rm = TRUE),
    avg_order = mean(order_value, na.rm = TRUE),
    orders = n(),
    .groups = "drop"
  ) %>% 
  mutate(
    sales_percent = (total_sales / sum(total_sales))*100 
  ) %>% 
  arrange(desc(total_sales))

print(sales_by_region)

# Resultat:
# North är den region som säljer mest totalt (116544),
# 37.1% av den totala försäljningen, och har flest ordrar (354), 
# medan East har högre värde per köp (337).
# South säljer minst (53170), 16.9% av den totala försäljningen,
# och har också lägre värde (277) per köp än andra regioner.



# Sammanfattningstabell 

summary_table <- tibble (
  category_top = sales_by_category$product_category[1],
  segment_top = sales_by_segment$customer_segment[1],
  region_top = sales_by_region$region[1]
)

print(summary_table)

# Sammanfattning:

# Electronics står för den största delen av försäljningen inom produktkategorier.

# I kundsegment är det Consumer som genererar mest total försäljning,
# medan Small Business spenderar mest per köp.
# När vi analyserar orderstorlek ser vi att Consumer gör flest köp i alla orderstorlekar (Low, Medium och High),
# medan Corporate har minst antal ordrar i alla orderstorlekar.

# När det gäller regioner är North den starkaste regionen, medan South säljer minst.






