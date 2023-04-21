library(targets)
library(tarchetypes)
library(RSQLite)

source("scripts/nettoyage.R")

source("scripts/requete.R")

source("scripts/figurer.R")

tar_option_set(packages = c("knitr","RSQLite","vioplot","igraph","scales"))

list(
  tar_target(
    name = path, # Cible
    command = "./Data/raw", # Dossier contenant les fichiers de données
    format = "file" # Format de la cible
  ),
  tar_target(
    name = file_paths, # Cible
    command = list.files(path) # Liste les fichiers dans le dossier
  ),
  
  tar_target(
    name = donneclean, # Cible pour le modèle
    command = nettoyage(file_paths) # Exécution de l'analyse
    ),
  tar_target(
    name = roquaite,
    command = requete(donneclean)
  ),
  tar_target(
    name = figure, # Cible pour l'exécution de la figure
    command = figurer(roquaite)
 ),
  tar_render(
    name = rapport, 
    path ="rapport/rapport.Rmd"

))
