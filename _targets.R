source("scripts/rawdata.R")
source("scripts/collaboration.R")
source ("scripts/cour.R")
source ("scripts/etudiant.R")
#source ("scripts/typeind.R")
library(targets)
library(tarchetypes)
#rajouter les deux fonctions que le prof pour mettre à jour
list(
  tar_target(
    rawdatatarget,
    rawdata() #¸étape prep donné dans target cours
  ),
  tar_target(
    clean_collaborationtarget, # Cible pour le modèle
    collaboration(rawdatatarget) # Exécution de l'analyse
  ),
  tar_target(
    clean_courtarget, # Cible pour l'exécution de la figure
    cour(rawdatatarget),
  ),
  tar_target(
    clean_etudianttarget,
    etudiant(rawdatatarget),
  )
)
source("_targets.R")
tar_glimpse()
