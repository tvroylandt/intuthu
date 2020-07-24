#' Theme ggplot2 pour les graphiques - Scouts et Guides de France
#'
#' @param base_family Police normale
#' @param head_family Police titres
#' @param base_size Taille normale
#' @param plot_title_size Taille titres
#' @param subtitle_size Taille sous-titre
#' @param caption_size Taille caption
#' @param text_col Couleur texte
#' @param main_background_color Couleur arriere-plan
#' @param base_line_size Taille lignes des grilles
#' @param grid Grille (no/x/y/xy)
#'
#' @importFrom ggplot2 element_blank element_line element_text margin theme element_rect
#' @return Un `ggplot2` theme.
#' @export
#'
theme_sgdf <- function(base_family = "Sarabun",
                       head_family = "Caveat Brush",
                       base_size = 12,
                       plot_title_size = 20,
                       subtitle_size = 16,
                       caption_size = 10,
                       text_col = "#003a5d",
                       base_line_size = 0.8,
                       main_background_color = "#FFFFFF",
                       grid = "xy") {
  theme_elements <-
    ggplot2::theme_minimal(
      base_family = base_family,
      base_size = base_size,
      base_line_size = base_line_size
    ) +
    theme(
      axis.text = element_text(color = text_col,
                               size = base_size),
      axis.title = element_text(
        color = text_col,
        size = base_size - 1,
        family = base_family
      ),
      strip.text = element_text(
        size = base_size,
        color = text_col,
        face = "plain",
        family = base_family
      ),
      plot.title = element_text(
        size = plot_title_size,
        family = head_family,
        face = "plain",
        color = text_col
      ),
      plot.subtitle = element_text(
        size = subtitle_size,
        family = head_family,
        face = "plain",
        color = text_col
      ),
      plot.caption = element_text(
        hjust = 0,
        size = caption_size,
        family = base_family,
        face = "plain",
        color = text_col
      ),
      legend.title = element_text(
        family = head_family,
        color = text_col,
        size = base_size + 2
      ),
      legend.text = element_text(
        family = base_family,
        color = text_col,
        size = base_size
      ),
      legend.background = element_rect(fill = main_background_color,
                                       color = main_background_color),
      legend.key = element_blank(),
      plot.title.position = "plot",
      plot.caption.position = "plot",
      panel.grid.minor = element_blank(),
      plot.margin = margin(10, 10, 10, 10),
      panel.spacing = grid::unit(1, "lines")
    )

  if (grid == "no") {
    theme_elements +
      theme(panel.grid.major = element_blank())
  } else if (grid == "x") {
    theme_elements +
      theme(panel.grid.major.y = element_blank())
  } else if (grid == "x") {
    theme_elements +
      theme(panel.grid.major.x = element_blank())
  } else if (grid == "xy") {
    theme_elements
  }
}

#' Theme ggplot2 pour les cartes - Scouts et Guides de France
#'
#' @details
#' Ce theme est a utiliser avec `ggplot2::geom_sf()`.
#'
#' @param base_family Police normale
#' @param head_family Police titres
#' @param base_size Taille normale
#' @param plot_title_size Taille titres
#' @param subtitle_size Taille sous-titre
#' @param caption_size Taille caption
#' @param text_col Couleur texte
#' @param main_background_color Couleur arriere-plan
#'
#' @importFrom ggplot2 element_blank element_line element_text margin theme element_rect
#' @return Un `ggplot2` theme.
#' @export
#'
theme_sgdf_carte <- function(base_family = "Sarabun",
                             head_family = "Caveat Brush",
                             base_size = 12,
                             plot_title_size = 20,
                             subtitle_size = 16,
                             caption_size = 10,
                             text_col = "#003a5d",
                             main_background_color = "#FFFFFF") {
  theme_elements <-
    ggplot2::theme_void(base_family = base_family,) +
    theme(
      strip.text = element_text(
        size = base_size,
        color = text_col,
        face = "plain",
        family = base_family
      ),
      plot.title = element_text(
        size = plot_title_size,
        family = head_family,
        face = "plain",
        color = text_col
      ),
      plot.subtitle = element_text(
        size = subtitle_size,
        family = head_family,
        face = "plain",
        color = text_col
      ),
      plot.caption = element_text(
        hjust = 0,
        size = caption_size,
        family = base_family,
        face = "plain",
        color = text_col
      ),
      legend.title = element_text(
        family = head_family,
        color = text_col,
        size = base_size + 2
      ),
      legend.text = element_text(
        family = base_family,
        color = text_col,
        size = base_size
      ),
      legend.background = element_rect(fill = main_background_color,
                                       color = main_background_color),
      legend.key = element_blank(),
      plot.title.position = "plot",
      plot.caption.position = "plot",
      panel.grid.minor = element_blank(),
      plot.margin = margin(10, 10, 10, 10),
      panel.spacing = grid::unit(1, "lines")
    )
}
