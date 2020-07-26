#' Fournit un picto d'une couleur
#'
#' @param picto Nom du picto
#' @param couleur Couleur
#'        (parmi "bleu_instit"/"orange_lj"/"bleu_sg"/"rouge_pk"/
#'                "vert_compa"/"vert_farfa"/"violet_vdl"/"blanc")
#' @param scale Echelle, en px
#'
#' @return Une image
#' @export
#'
picto <- function(picto,
                  couleur = "bleu_instit",
                  scale = "100") {
  # creation du chemin
  list_picto_init <- list.files(pkg_resource("picto"))

  chemin_picto <-
    pkg_resource("picto",
                 list_picto_init[grepl(paste0("_", picto, ".png"), list_picto_init)])

  # choix de la couleur
  couleur_fin <- if (couleur == "blanc") {
    "#ffffff"
  } else {
    sgdf_colors(paste0(couleur, "_1"))
  }

  # import img et colorisation
  magick::image_read(chemin_picto) %>%
    magick::image_colorize(opacity = 100,
                           color = couleur_fin) %>%
    magick::image_scale(scale)
}
