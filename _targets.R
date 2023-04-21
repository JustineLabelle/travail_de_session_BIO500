library(targets)
library(tarchetypes)
library(RSQLite)


source("scripts/nettoyage2.R")

source("scripts/requete2.R")

source("scripts/figurer.R")


#source("scripts/figurer.R")
#source("scripts/collaboration.R")
#source("scripts/cour.R")
#source("scripts/etudiant.R")
#source("scripts/manipulations.R")
#source("scripts/roquaite.R")
#source("scripts/figurer.R")
#source("rapport/rapport.Rmd")
#source("scripts/figurer1.R")
#source("scripts/figurer2.R")
#source("scripts/figurer3.R")

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
    command = nettoyage2(file_paths) # Exécution de l'analyse
    ),
  tar_target(
    name = roquaite,
    command = requete2(donneclean)
  ),
  tar_target(
    name = figure, # Cible pour l'exécution de la figure
    command = figurer(roquaite)
 ),
  tar_render(
    name = test,
    path ="rapport/test2/test2.Rmd"
    #library = rticles,
     #output_format="rticles::pnas_article"
))

#)#,
#  tar_target(
#    name = clean_courtarget, # Cible pour l'exécution de la figure
#    command = cour(rawdatatarget)
#  ),
#  tar_target(
#   name = clean_etudianttarget,
#    command = etudiant(rawdatatarget)
# ),
#  tar_target(
#   name = rawdatatarget,
#  command = rawdata(file_paths) #¸étape prep donné dans target cours
# ),