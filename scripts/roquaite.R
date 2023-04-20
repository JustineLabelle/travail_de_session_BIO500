roquaite<- function(){
  library(RSQLite)
  #Créer la connection avec le réseau
  con <- dbConnect(SQLite(), dbname="reseau.db")   
  #Requète permettant de compter le nombre de collaboration entre 
  requestinter <- "
  SELECT etudiant1 AS Ami1, etudiant2 AS Ami2, COUNT(*) AS nb_interaction
  FROM collaborations
  GROUP BY etudiant1, etudiant2
  ORDER BY nb_interaction DESC
  ;"
  
  #créer un dataframe avec la requète inter
  inter<- dbGetQuery(con,requestinter)
  inter
  
  #requète sql permettant de sortir les trois colonne d'intéret prenom_nom, formation_préalable et annee_debut
  sortircol<- "SELECT prenom_nom, formation_prealable, annee_debut 
  FROM etudiant
  ;"
  #créer un dataframe avec la requète sortircol
  resultat<-dbGetQuery(con,sortircol)
  resultat
  requete<-list(inter, resultat)
  
  rm(con,inter,resultat,requestinter,sortircol)
  return(requete)
  
  
}
