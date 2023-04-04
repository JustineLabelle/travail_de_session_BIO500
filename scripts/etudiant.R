etudiant<- function(rawdata) {
  ##changer le seul nom de colonne différent des autres pour Étudiant
  
  names(etudiantdata4)[names(etudiantdata4) == "prenom_nom."] <- "prenom_nom"
  
  #Utiliser subset pour selectionner seulememnt les colonnes interessante
  
  etudiantdata3 <- subset(etudiantdata3,select = c("prenom_nom","prenom","nom","region_administrative","regime_coop","formation_prealable","annee_debut","programme"))
  etudiantdata4 <- subset(etudiantdata4,select = c("prenom_nom","prenom","nom","region_administrative","regime_coop","formation_prealable","annee_debut","programme"))
  etudiantdata9 <- subset(etudiantdata9,select = c("prenom_nom","prenom","nom","region_administrative","regime_coop","formation_prealable","annee_debut","programme"))
  etudiantdata7 <- subset(etudiantdata7,select = c("prenom_nom","prenom","nom","region_administrative","regime_coop","formation_prealable","annee_debut","programme"))
  
  #on unie les tableaux
  etudiantdata<- rbind(etudiantdata1,etudiantdata2,etudiantdata3,etudiantdata4,etudiantdata5,etudiantdata6,etudiantdata7,etudiantdata8,etudiantdata9,etudiantdata10)
  
  
  #Enlever les lignes qui nous interesse pas pour la table étudiant
  etudiant<-unique(etudiantdata)
  nomrow<-seq(1,227,1)
  
  row.names(etudiant)<-nomrow
  
  # Spécification des valeurs à supprimer
  ligness_a_supprimer <- c("216", "207", "94","23", "196", "31", "120", "67","173", "122", "195"
                           , "206", "99","68", "55", "197", "16", "133","123", "71", "208"
                           , "72", "59","104", "117", "141", "184", "8","76", "28", "106"
                           , "29", "211","77", "169", "107", "78", "64","209", "10", "20"
                           , "52", "80","18", "81", "82", "19", "125","61", "83", "84"
                           , "38", "124","17", "86", "12", "54", "87","26", "88", "226"
                           , "90", "161","227", "11", "58", "63", "145","162","153")
  
  lignes_a_supprimer <- as.integer(ligness_a_supprimer)
  
  # Suppression des lignes spécifiées
  Students <- etudiant[-lignes_a_supprimer,]
  
  nomrow2<-seq(1,157,1)
  row.names(Students)<-nomrow2
  
  
  Students[39, ] <- c("penelope_robert",
                      "penelope",
                      "robert",
                      "capitale-nationale",
                      "VRAI",
                      "preuniversitaire",
                      "A2020",
                      "269000")
  
  Students[86, ] <- c("eve_dandonneau",
                      "eve",
                      "dandonneau",
                      NA,
                      NA,
                      NA,
                      NA,
                      NA)
  
  # Écriture de la table filtrée dans un nouveau fichier
  pathe<- file.path("data","clean","clean_etudiant.csv")
  write.csv(Students,pathe, row.names = F,col.names = T)
  
}
