#' Chargement ressources
#'
#' @param ... Autres arguments
pkg_resource <- function(...) {
  system.file("resources", ..., package = "intuthu", mustWork = TRUE)
}

#' Pipe operator
#'
#' See \code{magrittr::\link[magrittr:pipe]{\%>\%}} for details.
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL
