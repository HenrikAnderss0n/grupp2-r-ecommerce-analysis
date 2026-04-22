library(tidyverse)
library(here)

# FIGUR 1 – Frågeställning 1: Vilka produktkategorier driver högst försäljning?

sales_by_category <- df_clean %>%
  group_by(product_category) %>%
  summarise(total_sales = sum(order_value, na.rm = TRUE)) %>%
  arrange(desc(total_sales))

fig1 <- ggplot(sales_by_category,
               aes(x = reorder(product_category, total_sales),
                   y = total_sales,
                   fill = product_category)) +
  geom_col(show.legend = FALSE) +
  geom_text(aes(label = paste0(round(total_sales / 1000, 1), "k")),
            hjust = -0.1, size = 3.5) +
  coord_flip() +
  scale_y_continuous(labels = scales::comma, expand = expansion(mult = c(0, 0.15))) +
  scale_fill_brewer(palette = "Set2") +
  labs(
    title    = "Total försäljning per produktkategori",
    subtitle = "Mätt i ordervärde (SEK)",
    x        = "Produktkategori",
    y        = "Total försäljning (SEK)"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title    = element_text(face = "bold"),
    plot.subtitle = element_text(color = "grey50")
  )

print(fig1)

# Tolkning:
# Electronics har högst total försäljning, följt av Home och Sports. Fashion och Beauty bidrar minst till den totala försäljningen.

# FIGUR 2 – Frågeställning 2: Hur skiljer sig ordervärde mellan olika kundsegment?

fig2 <- ggplot(df_clean,
               aes(x = customer_segment,
                   y = order_value,
                   fill = customer_segment)) +
  geom_boxplot(alpha = 0.8, outlier.color = "red", outlier.size = 1.5,
               show.legend = FALSE) +
  stat_summary(fun = mean, geom = "point", shape = 18,
               size = 4, color = "white", show.legend = FALSE) +
  scale_fill_brewer(palette = "Pastel1") +
  scale_y_continuous(labels = scales::comma) +
  labs(
    title    = "Ordervärde per kundsegment",
    subtitle = "Rutan visar median och spridning. Vit diamant = medelvärde.",
    x        = "Kundsegment",
    y        = "Ordervärde (SEK)"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title    = element_text(face = "bold"),
    plot.subtitle = element_text(color = "grey50")
  )

print(fig2)

# Tolkning:
# Small Business har det högsta medianordervärdet, medan Corporate och Consumer ligger lägre. Spridningen är störst hos Consumer-segmentet.

# FIGUR 3 – Frågeställning 3: Hur skiljer sig försäljning mellan olika regioner?

sales_by_region <- df_clean %>%
  group_by(region) %>%
  summarise(
    total_sales = sum(order_value, na.rm = TRUE),
    orders      = n()
  ) %>%
  mutate(sales_percent = total_sales / sum(total_sales) * 100) %>%
  arrange(desc(total_sales))

fig3 <- ggplot(sales_by_region,
               aes(x = reorder(region, total_sales),
                   y = total_sales,
                   fill = region)) +
  geom_col(show.legend = FALSE) +
  geom_text(aes(label = paste0(round(sales_percent, 1), "%")),
            hjust = -0.1, size = 4, fontface = "bold") +
  coord_flip() +
  scale_y_continuous(labels = scales::comma, expand = expansion(mult = c(0, 0.18))) +
  scale_fill_brewer(palette = "Blues", direction = -1) +
  labs(
    title    = "Total försäljning per region",
    subtitle = "Procent visar regionens andel av total försäljning",
    x        = "Region",
    y        = "Total försäljning (SEK)"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    plot.title    = element_text(face = "bold"),
    plot.subtitle = element_text(color = "grey50")
  )

print(fig3)

# Tolkning:
# North är den starkaste regionen och står för störst andel av total försäljning. South säljer minst totalt, men skillnaderna mellan regionerna är relativt jämna.
