#' Chargement des fonds de carte SGDF
#'
#' @param niveau Niveau du fond de carte ("terr"/"cr")
#' @param type_geo_filtre Type de géographie un ou plusieurs de ("fr_metro"/"dom_tom"/"zoom_idf")
#'
#' @return Un fond de carte au format sf
#' @export
#'
#' @importFrom sf st_read
#' @importFrom dplyr filter
#' @importFrom rlang .data
#'
load_shp_sgdf <- function(niveau = "terr",
                          type_geo_filtre = c("fr_metro", "dom_tom", "zoom_idf", "All")) {
  # niveau a charger
  if (niveau == "terr") {
    shp_path <- "shp_sgdf_terr.shp"
  } else if (niveau == "terr_init") {
    shp_path <- "shp_sgdf_terr_init.shp"
  } else if (niveau == "cr") {
    shp_path <- "shp_sgdf_cr.shp"
  } else if (niveau == "groupes") {
    shp_path <- "shp_sgdf_groupes.shp"
  }

  # import et filtre
  shp_sgdf_load <-
    st_read(pkg_resource("shp", shp_path), quiet = TRUE)

  # filtre
  shp_sgdf <- filter(shp_sgdf_load,
                     .data$type_geo %in% type_geo_filtre)

  # output
  shp_sgdf
}
