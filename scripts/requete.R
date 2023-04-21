
#donneclean<- nettoyage2(allFiles)
requete<- function(donneclean) {
  
  etudiant <- donneclean[[3]]
  collaborations <- donneclean[[1]]
  
  library(RSQLite)
  con <- dbConnect(SQLite(), dbname="reseau.db") 
  
  
  #Enlever les tables pour s'assurer que  le réseau est vide et éviter de mettre en double
  dbExecute(con,"DROP TABLE etudiant;")
  dbExecute(con,"DROP TABLE collaborations;")
  
  
  
  collabo_1<-"CREATE TABLE collaborations (
  etudiant1     VARCHAR(50),
  etudiant2    VARCHAR(50),
  sigle     VARCHAR(6),
  session   VARCHAR(5),
  PRIMARY KEY (etudiant1, etudiant2, sigle, session),
  FOREIGN KEY (etudiant1) REFERENCES etudiant(prenom_nom),
  FOREIGN KEY (etudiant2) REFERENCES etudiant(prenom_nom),
  FOREIGN KEY (sigle) REFERENCES cours(sigle)
  );"
  dbSendQuery(con,collabo_1)
  

  
  auteurs_sql <- "CREATE TABLE etudiant (
  prenom_nom  VARCHAR(50),
  prenom      VARCHAR(50),
  nom         VARCHAR(50),
  region_administrative      VARCHAR(40),
  regime_coop         BOOLEAN(50),
  formation_prealable VARCHAR(40),
  annee_debut        VARCHAR(40),
  programme         VARCHAR(40),
  PRIMARY KEY (prenom_nom)
  );"
  
  dbSendQuery(con, auteurs_sql)
  
  
  #Mettre les données dans la bd
  
  dbWriteTable(con, append = TRUE, name= "etudiants", value = etudiant, row.names = FALSE)
  dbWriteTable(con, append = TRUE, name= "collaborations", value = collaborations, row.names = FALSE)
  
  
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
  FROM etudiants
  ;"
  #créer un dataframe avec la requète sortircol
  resultat<-dbGetQuery(con,sortircol)
  resultat
  requete<-list(inter, resultat)
  
  rm(list = setdiff(ls(), c("collaborations", "cour", "etudiant", "requete", "con")))
  dbDisconnect(con)
  return(requete)
  
}
#requete(nettoyage2(allFiles))
