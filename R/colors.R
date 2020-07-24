#' Vecteur de couleurs
#'
#' `sgdf_colors()` donne les couleurs avec les codes hexadecimaux.
#'
#' @param ... Le nom de la couleur.
#' @return Un vecteur nomme avec les couleurs
#' @export
#'
sgdf_colors <- function(...) {
  # construction de la palette
  vect_col1 <- c(
    "bleu_instit" = "#003a5d",
    "orange_lj" = "#ff8300",
    "bleu_sg" = "#0077b3",
    "rouge_pk" = "#d03f15",
    "vert_compa" = "#007254",
    "vert_farfa" = "#65bc99",
    "violet_vdl" = "#6e74aa"
  )

  vect_col0 <-
    colorspace::darken(vect_col1, amount = 0.1, method = "relative")
  vect_col2 <-
    colorspace::lighten(vect_col1, amount = 0.5, method = "relative")
  vect_col3 <-
    colorspace::lighten(vect_col1, amount = 0.75, method = "relative")
  vect_col4 <-
    colorspace::lighten(vect_col1, amount = 0.9, method = "relative")

  names_colors <- names(vect_col1)

  names(vect_col0) <- paste0(names_colors, "_0")
  names(vect_col1) <- paste0(names_colors, "_1")
  names(vect_col2) <- paste0(names_colors, "_2")
  names(vect_col3) <- paste0(names_colors, "_3")
  names(vect_col4) <- paste0(names_colors, "_4")

  # vecteur
  sgdf_colors_vector <-
    c(vect_col0, vect_col1, vect_col2, vect_col3, vect_col4)

  # interrogation
  cols <- c(...)

  if (is.null(cols))
    return (sgdf_colors_vector)

  sgdf_colors_vector[cols]
}

#' Interpolation des palettes
#'
#' @param palette L'une des palettes de [sgdf_palettes].
#' @param reverse Indique si il faut inverser la palette.
#' @param ... Arguments de [grDevices::colorRampPalette()].
#' @return Renvoie un numeric (nb de couleurs) et un vecteur de couleurs.
#' @keywords internal
#'
sgdf_pal_inter <-
  function(palette = "pal_sgdf_main",
           reverse = FALSE,
           ...) {
    pal <- intuthu::sgdf_palettes[[palette]]

    if (isTRUE(reverse))
      pal <- rev(pal)

    grDevices::colorRampPalette(pal, ...)
  }

#' Discrete color scale
#'
#' @inheritParams sgdf_pal_inter
#' @param ... Arguments de [ggplot2::discrete_scale()].
#'
#' @export
#'
scale_color_sgdf_discrete <- function(palette = "pal_sgdf_main",
                                      reverse = FALSE,
                                      ...) {
  pal <- sgdf_pal_inter(palette = palette, reverse = reverse)

  ggplot2::discrete_scale("color", paste0("sgdf_", palette), palette = pal,
                          ...)
}

#' Discrete fill scale
#'
#' @inheritParams sgdf_pal_inter
#' @inheritDotParams scale_color_sgdf_discrete
#'
#' @export
#'
scale_fill_sgdf_discrete <- function(palette = "pal_sgdf_main",
                                     reverse = FALSE,
                                     ...) {
  pal <- sgdf_pal_inter(palette = palette, reverse = reverse)

  ggplot2::discrete_scale("fill", paste0("sgdf_", palette), palette = pal, ...)
}

#' Continuous color scale
#'
#' @inheritParams sgdf_pal_inter
#' @param ... Arguments de [ggplot2::scale_color_gradientn()].
#'
#' @export
#'
scale_color_sgdf_continuous <- function(palette = "pal_sgdf_bleu_instit",
                                        reverse = FALSE,
                                        ...) {
  pal <- sgdf_pal_inter(palette = palette, reverse = reverse)

  ggplot2::scale_color_gradientn(colors = pal(256), ...)
}

#' Continuous fill scale
#'
#' @inheritParams sgdf_pal_inter
#' @param ... Arguments de [ggplot2::scale_fill_gradientn()].
#'
#' @export
#'
scale_fill_sgdf_continuous <- function(palette = "pal_sgdf_bleu_instit",
                                       reverse = FALSE,
                                       ...) {
  pal <- sgdf_pal_inter(palette = palette, reverse = reverse)

  ggplot2::scale_fill_gradientn(colors = pal(256), ...)
}
