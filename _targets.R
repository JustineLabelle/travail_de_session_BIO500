#librairie nécessaire
library(targets)
library(tarchetypes)


#Définir les source

source("scripts/nettoyage.R")

source("scripts/requete.R")

source("scripts/figurer.R")

#donner à target les packages utilisé
tar_option_set(packages = c("knitr","RSQLite","vioplot","igraph","scales", "rticles"))

#création du pipeline

list(
  tar_target(
    name = path, # Cible
    command = "./Data/raw", # Dossier contenant les fichiers de données
    format = "file" # Format de la cible
  ),
  tar_target(
    name = file_paths, # Importer donnée
    command = list.files(path) # Liste les fichiers dans le dossier
  ),
  
  tar_target(
    name = donneclean, # Cible nettoyage donnée
    command = nettoyage(file_paths) # Exécution du nettoyage de donnée
    ),
  tar_target(
    name = requeteSQL, #Cible les requète sql
    command = requete(donneclean) # Fait les requête
  ),
  tar_target(
    name = figure, # Cible pour l'exécution de la figure
    command = figurer(requeteSQL) # Sort donnée pour les figures
 ),
  tar_render(
    name = rapport, #Cible notre rapport
    path ="rapport/rapport.Rmd" #Definir où se situe le markdown du rapport

))
