#' Ajout du logo SGDF
#'
#' @param plot Un graphique `ggplot2`
#' @param type La couleur du logo, parmi :
#'  ("instit"/"symbole"/"lj"/"sg"/"pk"/"compa"/"farfa"/"vdl")
#'
#' @return Un graphique `ggplot2`
#' @export
#'
ajout_logo_sgdf <-
  function(plot = ggplot2::last_plot(),
           type = "instit") {
    # chargement du logo
    logo <-
      png::readPNG(pkg_resource("logo", paste0("logo_sgdf_", type, ".png"))) %>%
      grid::rasterGrob(x = 0.65,
                       y = 1.3,
                       just = c("left", "top")) %>%
      grid::grobTree()

    # ajout sur le graph
    graph_logo <- ggpubr::ggarrange(
      plot,
      logo,
      ncol = 1,
      nrow = 2,
      heights = c(1, 0.16)
    )

    # output
    graph_logo
  }
