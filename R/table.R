#' Theme SGDF pour les tableaux
#'
#' @param flex_table Un tableau fait avec flextable()
#'
#' @return Un tableau flextable() mis en forme
#' @export
#'
#' @importFrom flextable fontsize
#' @importFrom flextable font
#' @importFrom flextable bold
#' @importFrom flextable align
#' @importFrom flextable bg
#' @importFrom flextable color
#' @importFrom flextable border
#' @importFrom flextable autofit
#'
theme_flex_sgdf <- function(flex_table) {
  flex_table %>%
    fontsize(part = "all", size = 14) %>%
    fontsize(part = "header", size = 16) %>%
    font(part = "all", fontname = "Sarabun") %>%
    bold(part = "header", bold = TRUE) %>%
    align(part = "header", align = "center") %>%
    bg(part = "header", bg = sgdf_colors("bleu_instit_1")) %>%
    color(part = "header", color = "white") %>%
    color(part = "body", color = sgdf_colors("bleu_instit_1")) %>%
    border(
      part = "all",
      border.top = officer::fp_border(color = "lightgrey", width = 2.5),
      border.bottom = officer::fp_border(color = "lightgrey", width = 2.5)
    ) %>%
    autofit(add_w = 0.3, add_h = 0.3)
}

#' Conversion d'un tableau flextable en ggplot
#'
#' @param flex_table Un tableau fait avec flextable()
#'
#' @return Un graph ggplot
#' @export
#'
passage_flex_img <- function(flex_table) {
  # save
  flex_table %>%
    flextable::save_as_image(paste0(tempdir(), "/tab_temp.png"))

  # format ggplot
  graph_flex <- png::readPNG(paste0(tempdir(), "/tab_temp.png")) %>%
    grid::rasterGrob() %>%
    grid::grobTree()

  # output
  graph_flex
}
