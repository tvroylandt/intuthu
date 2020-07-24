#' Dependances HTML pour les polices SGDF
#'
#' `html_dependency_sarabun()` fournit la dependance pour Sarabun
#' `html_dependency_raleway()` fournit la dependance pour Raleway
#' `html_dependency_caveat_brush()` fournit la dependance pour Caveat Brush
#'
#' @return Un objet a inclure dans une liste de dependances de
#'   [attachDependencies][htmltools::attachDependencies()].
#'
#' @name html-dependencies
NULL

#' Dependance HTML pour Sarabun
#' @rdname html-dependencies
#' @export
html_dependency_sarabun <- function() {
  htmltools::htmlDependency(
    "Sarabun",
    "1.0",
    src = pkg_resource("fonts", "sarabun"),
    stylesheet = file.path("stylesheet.css"),
    all_files = TRUE
  )
}

#' Dependance HTML pour Raleway
#' @rdname html-dependencies
#' @export
html_dependency_raleway <- function() {
  htmltools::htmlDependency(
    "Raleway",
    "1.0",
    src = pkg_resource("fonts", "raleway"),
    stylesheet = file.path("stylesheet.css"),
    all_files = TRUE
  )
}

#' Dependance HTML pour Caveat Brush
#' @rdname html-dependencies
#' @export
html_dependency_caveat_brush <- function() {
  htmltools::htmlDependency(
    "Caveat Brush",
    "1.0",
    src = pkg_resource("fonts", "caveat-brush"),
    stylesheet = file.path("stylesheet.css"),
    all_files = TRUE
  )
}

#' Chargement des polices installes
#' @export
load_fonts <- function() {
  pdfFonts <- grDevices::pdfFonts

  extrafont::loadfonts(quiet = TRUE)
  if (.Platform$OS.type == "windows") {
    windowsFonts <- grDevices::windowsFonts
    extrafont::loadfonts(device = "win", quiet = TRUE)
  }
}

#' Verif de la presence des polices et chargement
#'
#' @param fonts Liste des polices
#'
#' @export
check_fonts_in_r <-
  function(fonts = c("Sarabun", "Raleway", "Caveat Brush")) {
    # Import fonts
    fonts_no_space <- gsub(" ", "", fonts)
    res <- lapply(fonts_no_space, function(x) {
      res <- tryCatch(
        extrafont::font_import(
          paths = dirname(systemfonts::match_font(x)$path),
          pattern = x,
          prompt = FALSE
        ),
        error = function(e)
          FALSE
      )
      if (is.null(res)) {
        res <- TRUE
      }
      res
    })
    res <- unlist(res)
    names(res) <- fonts

    # load installed fonts
    load_fonts()

    # If some are missing
    if (!all(res)) {
      warning(
        "Veuillez installer\n",
        paste(names(res)[!res], collapse = ", "),
        ".\n",
        call. = FALSE,
        immediate. = TRUE
      )
    }

    res
  }
