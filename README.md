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

Exempel på variabler i datan:
- orderdatum
- kundsegment
- kundtyp
- region och stad
- produktkategori
- antal
- styckpris
- rabatt
- leveranstid
- returstatus

## Valda frågeställningar

Projektet utgår från följande frågeställningar:

1. Vilka produktkategorier verkar driva högst försäljning?
2. Hur skiljer sig ordervärde mellan olika kundsegment?
3. Hur skiljer sig försäljning mellan olika regioner?

## Metod

Analysen genomfördes i flera steg:

- dataförståelse
- datastädning och förberedelse
- statistiska sammanfattningar
- visualisering i R
- tolkning av resultat

I datastädningen standardiserades textvärden, saknade värden hanterades och nya variabler skapades för att stödja analysen, bland annat:

- `order_value`
- `shipping_category`

## Projektstruktur

- `data/` – innehåller datasetet `ecommerce_orders.csv`
- `R/` – innehåller skript för analysen
- `report/` – innehåller rapportens källfil och färdiga rapportversioner
- `README.md` – projektbeskrivning
- `grupp2-r-ecommerce-analysis.Rproj` – projektfil för RStudio

## Hur man kör projektet

1. Klona repot från GitHub
2. Öppna projektfilen `grupp2-r-ecommerce-analysis.Rproj` i RStudio
3. Installera vid behov de paket som används i projektet
4. Kör skriptfilerna i rätt ordning från mappen `R/`

Nuvarande ordning:

1. `01_dataforstaelse.R`
2. `02_datastadning_och_forberedelse.R`
3. `03_statistiska_sammanfattningar.R`
4. `04_visualisering.R`

## OBS

**Kom ihåg att lägga till `00_main.R` när all kod är helt färdig, så att projektet kan köras i rätt ordning via `source()`.**

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

PowerPoint-presentationen och talmanusen har tagits fram gemensamt av gruppen.

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