# -------------------------- #
## Construction des SHP SGDF
# - groupes
# -------------------------- #

library(tidyverse)
library(sf)

# Import ------------------------------------------------------------------
df_groupes <- readxl::read_xlsx("data-raw/groupes 2020.xlsx")

# Format SHP --------------------------------------------------------------
shp_groupes <-
  st_as_sf(df_groupes,
           coords = c("LONGITUDE", "LATITUDE"),
           crs = 4326) %>%
  rename(terr = `CODE Territoire`,
         groupe = `CODE Groupe`) %>%
  mutate(cr = str_sub(terr, 1, 2),
         type_geo = if_else(!cr %in% c("80", "90"), "fr_metro", "dom_tom")) %>%
  select(cr, terr, groupe, type_geo, geometry)

# Export ------------------------------------------------------------------
st_write(shp_groupes,
         "inst/resources/shp/shp_sgdf_groupes.shp",
         delete_dsn = TRUE)
