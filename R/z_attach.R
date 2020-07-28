#' Ajout des polices au chargement du package
#'
#' @param libname Dummy
#' @param pkgname Dummy
#'
#' @return Rien
.onAttach <- function(libname, pkgname) {
  # chargement des polices
  load_fonts()
  # message sur l'installation des polices
  tryCatch(check_fonts_in_r(), warning = function(w) {
    packageStartupMessage(w$message)
  })
}
