#' Chargement ressources
#'
#' @param ... Autres arguments
pkg_resource <- function(...) {
  system.file("resources", ..., package = "intuthu", mustWork = TRUE)
}
