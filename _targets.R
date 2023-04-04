source("scripts/rawdata.R")
source("scripts/collaboration.R")
source ("scripts/cour.R")
source ("scripts/etudiant.R")
#source ("scripts/typeind.R")
library(targets)

list(
  tar_target(
    rawdatatarget,
    rawdata()
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