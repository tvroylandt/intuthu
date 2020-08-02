#' Tableau de bord flexdashboard SGDF
#'
#' @return Format flex SGDF
#' @export
#'
sgdf_flexdashboard <- function(){
  # fichiers de style
  css_sgdf <- pkg_resource("stylesheets", "sgdf_style.css")
  css_sgdf_flex <-
    pkg_resource("stylesheets", "sgdf_flex.css")

  logo_sgdf <- pkg_resource("logo", "logo_sgdf_instit.png")

  # template
  flexdashboard::flex_dashboard(
    logo = logo_sgdf,
    fig_width = 6.5,
    fig_height = 4,
    theme = NULL,
    css = c(css_sgdf, css_sgdf_flex)
  )
}
