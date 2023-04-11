library(targets)
library(tarchetypes)

source("scripts/rawdata.R")
source("scripts/collaboration.R")
source ("scripts/cour.R")
source ("scripts/etudiant.R")
#source ("scripts/typeind.R")

list(
  tar_target(
    name = path, # Cible
    command = "./Data/raw", # Dossier contenant les fichiers de données
    format = "file" # Format de la cible
  ),
  tar_target(
    name = file_paths, # Cible
    command = list.files(path, full.names = TRUE) # Liste les fichiers dans le dossier
  ),
  tar_target(
    name = rawdatatarget,
    command = rawdata(file_paths) #¸étape prep donné dans target cours
  ),
  tar_target(
    name = clean_collaborationtarget, # Cible pour le modèle
    command = collaboration(rawdatatarget) # Exécution de l'analyse
  ),
  tar_target(
    name = clean_courtarget, # Cible pour l'exécution de la figure
    command = cour(rawdatatarget),
  ),
  tar_target(
    name = clean_etudianttarget,
    command = etudiant(rawdatatarget),
  ),
  tar_target(
    name = manip, # Cible pour l'exécution de la figure
    command = manipulations(clean_collaborationtarget,clean_etudianttarget,clean_courtarget),
  )
)

