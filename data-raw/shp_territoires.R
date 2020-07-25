# -------------------------- #
## Construction des SHP SGDF
# - territoires
# - centres de ressources
# -------------------------- #

library(tidyverse)
library(sf)
library(maptools)

# Import ------------------------------------------------------------------
# shp initial des territoires
shp_terr_init <-
  st_read("data-raw/shp_territoires_init/TERRITOIRE-N.shp") %>%
  select(CODE_TER, CR, geometry) %>%
  rename(terr = CODE_TER,
         cr = CR)

# liste des groupes

# ref
# ref_terr

# ref_cr

# France metropolitaine ---------------------------------------------------
shp_terr_fr_metro <- shp_terr_init %>%
  filter(!cr %in% c("80", "90")) %>%
  rmapshaper::ms_simplify() %>%
  st_transform(4326) %>%
  mutate(type_geo = "fr_metro")

# # Ajout DOM ---------------------------------------------------------------
# Fonction de transformation
transformation_shp <-
  function(object,
           filter_terr,
           rot,
           scale,
           shift,
           keep = 0.05,
           type_geo = "dom_tom") {
    object %>%
      filter(terr %in% filter_terr) %>%
      st_transform(4326) %>%
      as("Spatial") %>%
      elide(rotate = rot) %>%
      elide(scale = scale) %>%
      elide(shift = shift) %>%
      st_as_sf() %>%
      rmapshaper::ms_simplify(keep = keep) %>%
      st_set_crs(4326) %>%
      mutate(type_geo = type_geo)
  }

# Martinique
shp_martinique <- shp_terr_init %>%
  transformation_shp(
    filter_terr = "804200000",
    rot = 0,
    scale = 1,
    shift = c(-2, 40.8)
  )

# Guadeloupe
shp_guadeloupe <- shp_terr_init %>%
  transformation_shp(
    filter_terr = "804100000",
    rot = 0,
    scale = 1,
    shift = c(0, 41)
  )

# Saint-Martin
shp_saint_martin <- shp_terr_init %>%
  transformation_shp(
    filter_terr = "804900000",
    rot = 0,
    scale = 0.5,
    shift = c(-1.8, 39.8),
    keep = 0.5
  )

# Guyane
shp_guyane <- shp_terr_init %>%
  transformation_shp(
    filter_terr = "804300000",
    rot = 0,
    scale = 1,
    shift = c(2, 41)
  )

# La Réunion
shp_reunion <- shp_terr_init %>%
  transformation_shp(
    filter_terr = "804400000",
    rot = 0,
    scale = 1,
    shift = c(4, 41)
  )

# Saint-Pierre et Miquelon
shp_saint_pierre_miquelon <- shp_terr_init %>%
  transformation_shp(
    filter_terr = "909920000",
    rot = 0,
    scale = 0.8,
    shift = c(0, 39.5),
    keep = 0.5
  )

# Mayotte
shp_mayotte <- shp_terr_init %>%
  transformation_shp(
    filter_terr = "805600000",
    rot = 0,
    scale = 1,
    shift = c(2, 39.5)
  )

# Polynésie
shp_polynesie <- shp_terr_init %>%
  transformation_shp(
    filter_terr = "804600000",
    rot = 0,
    scale = 1.2,
    shift = c(6, 40.2),
    keep = 0.7
  )

# Nouvelle-Calédonie
shp_nouvelle_caledonie <- shp_terr_init %>%
  transformation_shp(
    filter_terr = "804700000",
    rot = 0,
    scale = 2.3,
    shift = c(3.5, 39.8)
  )

# Highlight IDF -----------------------------------------------------------
shp_zoom_idf <- shp_terr_fr_metro %>%
  transformation_shp(
    filter_terr = c(
      "0",
      "107820000",
      "117540000",
      "117530000",
      "107850000",
      "117520000",
      "119300000",
      "107870000",
      "117700000",
      "109500000",
      "107860000",
      "119100000",
      "107840000",
      "117510000",
      "119420000",
      "119410000",
      "109220000",
      "109210000"
    ),
    rot = 0,
    scale = 4,
    shift = c(7.5, 49.5),
    keep = 0.7,
    type_geo = "zoom_idf"
  )

# Fusion ------------------------------------------------------------------
shp_terr <- shp_terr_fr_metro %>%
  bind_rows(shp_martinique) %>%
  bind_rows(shp_guadeloupe) %>%
  bind_rows(shp_saint_martin) %>%
  bind_rows(shp_reunion) %>%
  bind_rows(shp_guyane) %>%
  bind_rows(shp_saint_pierre_miquelon) %>%
  bind_rows(shp_mayotte) %>%
  bind_rows(shp_polynesie) %>%
  bind_rows(shp_nouvelle_caledonie) %>%
  bind_rows(shp_zoom_idf)

# Recodages ---------------------------------------------------------------
# TO DO

# Fond de carte CR --------------------------------------------------------
shp_cr <- shp_terr %>%
  group_by(cr) %>%
  summarise() %>%
  ungroup()

# Export ------------------------------------------------------------------
st_write(shp_terr,
         "inst/resources/shp/shp_sgdf_terr.shp",
         delete_dsn = TRUE)

st_write(shp_cr,
         "inst/resources/shp/shp_sgdf_cr.shp",
         delete_dsn = TRUE)
