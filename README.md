
# *intuthu*

*intuthu* veut dire “fumée” en zoulou.

L’objectif est de faciliter et d’harmoniser les analyses du pôle statistique de l’équipe nationale développement des Scouts et Guides de
France.

## Installation

L’installation se fait, pour les personnes habilitées, par :

``` r
remotes::install_github("sgdf-stat/intuthu")
```

Ce package contient :

- des élements graphiques aux couleurs de la charte graphique rénovée en 2019 :

  - thème `ggplot2` ;
  - palettes de couleurs ;
  - échelles (`scale`) associées ;
  - polices d'écriture : Sarabun pour le texte courant, Raleway pour les titres "sérieux", Caveat Brush pour les titres normaux ;
  - pictogrammes de la charte graphique ;
  - templates Rmd pour :
  
    - création de documents paginés en PDF avec `pagedown`. En deux versions, complète et légère (**TO DO - version light**) ;
    - **TO DO -** création de tableaux de bords statiques avec `flexdashboard`.
    
- des fonds de carte, au format `shp` :

  - polygones aux niveaux territoires et centres de ressources ;
  - **TO DO -** points pour la localisation des groupes.
  
- **TO DO -** des référentiels pour les codes fonctions, structures, formation, etc.
- des vignettes décrivant :

  - l'utilisation des différents éléments graphiques ;
  - la construction de cartes ;
  - **TO DO -** l'ajout des référentiels à certaines données ;
  - **TO DO -** comment se connecter et utiliser les bases de données SGDF ;
  - **TO DO -** une revue des concepts principaux et de leurs modes de calcul.
  
### TO DO

**- utilisation des fonctions fonts pour l'import ?**

## Qualité

**TO DO -** L'ensemble est versionné sur Github, soumis à un contrôle qualité strict au travers d'un `check` et d'une couverture du code *via* des tests. Un site de documentation par `pkgdown` est construit automatiquement.

Il est conseillé de regarder des utilisations de ce package dans d'autres projets :

- **TO DO -**  
- **TO DO -** 

## Contact

Le contact pour ce package est Thomas Vroylandt (thomas@vroylandt.com), équipier national statistiques.
