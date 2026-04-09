library(tidyverse)

# 1.Vilka produktkategorier verkar driva högst försäljning? 

sales_by_category <- df_clean %>% 
  group_by(product_category) %>% 
  summarise(
    avg_order = mean(order_value, na.rm = TRUE),
    median_order = median(order_value, na.rm = TRUE),
    total_sales = sum(order_value, na.rm = TRUE),
    orders = n()
  ) %>% 
  arrange(desc(total_sales))

sales_by_category

# Resultat:
# Electronics har högst total försäljning (155500), följt av Home och Sports.


# 2.Hur skiljer sig ordervärde mellan olika kundsegment?

sales_by_segment <- df_clean %>% 
  group_by(customer_segment) %>% 
  summarise(
    avg_order = mean(order_value, na.rm = TRUE),
    median_order = median(order_value, na.rm = TRUE),
    total_sales = sum(order_value, na.rm = TRUE),
    orders = n()
  ) %>% 
  arrange(desc(total_sales))

sales_by_segment

# Resultat:
# Consumer genererar mest total försäljning (170338),
# medan Small Business spenderar mest per köp (346).
# Corporate bidrar minst både i antal ordrar (169) och total försäljning (39744).


# 3.Hur skiljer sig försäljning mellan olika regioner?

sales_by_region <- df_clean %>% 
  group_by(region) %>% 
  summarise(
    total_sales = sum(order_value, na.rm = TRUE),
    avg_order = mean(order_value, na.rm = TRUE),
    orders = n()
  ) %>% 
  mutate(
    sales_percent = (total_sales / sum(total_sales))*100 
  ) %>% 
  arrange(desc(total_sales))

sales_by_region

# Resultat:
# North är den region som säljer mest totalt (116544) och har flest ordrar (354), 
# medan East har högre värde per köp (337).
# South säljer minst (53170) och har också lägre värde (277) per köp än andra regioner.

summary_table <- tibble (
  category_top = sales_by_category$product_category[1],
  segment_top = sales_by_segment$customer_segment[1],
  region_top = sales_by_region$region[1]
)

summary_table

# Sammanfattning:
# Vi har beräknat statistiska sammanfattningar för att jämföra försäljning
# mellan produktkategorier, kundsegment och regioner.
# Electronics och Consumer står för den största delen av försäljningen.
# Small Business spenderar mest per köp.
# North är den starkaste regionen, medan South säljer minst.

