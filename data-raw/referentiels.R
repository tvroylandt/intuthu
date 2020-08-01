# -------------- #
## Référentiels
# -------------- #

library(tidyverse)

# en sortie
# une liste nommeee par thematique avec les noms

# fonction
# fonction regroupée
# couleur
# type structure
# territoire
# cr
# formations
# historique des fusions de groupe/dedoublonnage

# usethis::use_data(referentiels, overwrite = TRUE)

test <- read_rds("../Scoutisme - statistique/Data_sgdf/Data_adherents/histo_adherents.rds")

test2 <- read_rds("../Scoutisme - statistique/Data_sgdf/Data_structures/histo_structures.rds")

test %>%
  distinct(fonction_code) %>%
  mutate(code1 = str_sub(fonction_code, 1, 1),
         code2 = str_sub(fonction_code, 1, 2),
         code3 = str_sub(fonction_code, 1, 3),
         code4 = str_sub(fonction_code, 4, 5))

# "RG" = "300",
# "RGA" = "301",
# "Aumonier" = "302",
# "Secrétaire" = "307",
# "Trésorier" = "309",
# "Cléophas" = "316",
# "Chargé de mission" = c("330", "330M", "333"),
# "Resp dev et réseaux" = "380"
# ),
# fonction_regroupe = case_when(
#   fonction_code %in% c("300", "301") ~ "RG/RGA",
#   str_sub(fonction_code, 1, 3) == "180" ~ "Autres",
#   str_sub(fonction_code, 1, 1) == "3" ~ "Equipe de groupe",
#   str_sub(fonction_code, 1, 1) == "1" ~ "Jeune",
#   fonction_code == "240" ~ "Acc. compa.",
#   fonction_code %in% c("270", "271") ~ "Resp./Parent farfa.",
#   str_sub(fonction_code, 1, 1) == "2" ~ "Chef",
#   str_sub(fonction_code, 1, 1) %in% c("5", "6") ~ "Equipe territoriale",
#   TRUE ~ "Autres"
