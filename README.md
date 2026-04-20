# Grupp 2 – E-handel

Detta projekt är en gruppuppgift i kursen **R-programmering för dataanalys**.  
Projektet fokuserar på att analysera orderdata från en e-handelsverksamhet för att undersöka försäljning, kundsegment och regionala skillnader.

## Projektets mål

Målet med projektet är att genomföra en tydlig och relevant dataanalys i R utifrån ett e-handelscase.  
Analysen ska ge ett enkelt beslutsunderlag genom att visa mönster i försäljning mellan produktkategorier, kundsegment och regioner.

## Data

Projektet använder filen:

- `data/ecommerce_orders.csv`

Datasetet innehåller **1000 observationer** och **16 variabler**.


## Valda frågeställningar

Projektet utgår från följande frågeställningar:

1. Vilka produktkategorier verkar driva högst försäljning?
2. Hur skiljer sig ordervärde mellan olika kundsegment?
3. Hur skiljer sig försäljning mellan olika regioner? *(egen frågeställning)*

## Metod

Analysen genomfördes i flera steg:

- dataförståelse
- datastädning och förberedelse
- statistiska sammanfattningar
- visualisering i R
- tolkning av resultat

I datastädningen standardiserades textvärden, saknade värden hanterades och nya variabler skapades för att stödja analysen:

- `order_value`
- `order_size`

## Filer

- `R/01_dataforstaelse.R` läser in och undersöker data
- `R/02_datastadning_och_forberedelse.R` städar och förbereder data
- `R/03_statistiska_sammanfattningar.R` gör de statistiska sammanfattningarna
- `R/04_visualisering.R` skapar visualiseringar
- `run_analysis.R` kör hela projektet i rätt ordning
- `report/` innehåller rapportens källfil och färdiga rapportversioner
- `README.md` är projektets beskrivning
- `grupp2-r-ecommerce-analysis.Rproj` är projektfilen för RStudio

## Så kör du projektet

Öppna projektet i RStudio och kör `run_analysis.R`.

## Paket

Projektet använder följande paket:

- `tidyverse`
- `here`

## Ansvarsfördelning

- Henrik: dataförståelse, projektstruktur och README
- Nadine: datastädning och förberedelse
- Milda: statistiska sammanfattningar och resultat
- Azar: visualisering
- Henry: tolkning, slutsatser och rapport/presentation

PowerPoint-presentationen har tagits fram gemensamt av gruppen.

## Resultat i korthet

Analysen visar bland annat att:

- **Electronics** har högst total försäljning
- **Consumer** står för högst total försäljning
- **Small Business** har högst ordervärde per köp
- **North** har högst total försäljning
- **East** har högst genomsnittligt ordervärde per köp
- **South** har lägst total försäljning

## Begränsningar

Analysen bygger på ett avgränsat dataset och visar mönster i just detta urval.  
Vissa värden saknades i datan och ersattes vid datastädningen, vilket kan påverka resultaten något.  
Analysen är beskrivande och visar skillnader mellan grupper, men den kan inte fastställa säkra orsaksamband.