# Definition des palettes
sgdf_palettes <- list(
  "pal_sgdf_main" = sgdf_colors(
    "bleu_instit_1",
    "orange_lj_1",
    "bleu_sg_1",
    "rouge_pk_1",
    "vert_compa_1",
    "vert_farfa_1",
    "violet_vdl_1"
  ),
  "pal_sgdf_bleu_instit" = sgdf_colors(
    "bleu_instit_0",
    "bleu_instit_1",
    "bleu_instit_2",
    "bleu_instit_3",
    "bleu_instit_4"
  ),
  "pal_sgdf_orange_lj" = sgdf_colors(
    "orange_lj_0",
    "orange_lj_1",
    "orange_lj_2",
    "orange_lj_3",
    "orange_lj_4"
  ),
  "pal_sgdf_bleu_sg" = sgdf_colors(
    "bleu_sg_0",
    "bleu_sg_1",
    "bleu_sg_2",
    "bleu_sg_3",
    "bleu_sg_4"
  ),
  "pal_sgdf_rouge_pk" = sgdf_colors(
    "rouge_pk_0",
    "rouge_pk_1",
    "rouge_pk_2",
    "rouge_pk_3",
    "rouge_pk_4"
  ),
  "pal_sgdf_vert_compa" = sgdf_colors(
    "vert_compa_0",
    "vert_compa_1",
    "vert_compa_2",
    "vert_compa_3",
    "vert_compa_4"
  ),
  "pal_sgdf_vert_farfa" = sgdf_colors(
    "vert_farfa_0",
    "vert_farfa_1",
    "vert_farfa_2",
    "vert_farfa_3",
    "vert_farfa_4"
  ),
  "pal_sgdf_violet_vdl" = sgdf_colors(
    "violet_vdl_0",
    "violet_vdl_1",
    "violet_vdl_2",
    "violet_vdl_3",
    "violet_vdl_4"
  )
)

usethis::use_data(sgdf_palettes, overwrite = TRUE)
