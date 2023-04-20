etudiant<- function(rawdatatarget) {


  
  ##changer le seul nom de colonne différent des autres pour Étudiant
  
  names(rawdatatarget$etudiantdata4)[names(rawdatatarget$etudiantdata4) == "prenom_nom."] <- "prenom_nom"
  
  #Utiliser subset pour selectionner seulememnt les colonnes interessante
  
  rawdatatarget$etudiantdata3 <- subset(rawdatatarget$etudiantdata3,select = c("prenom_nom","prenom","nom","region_administrative","regime_coop","formation_prealable","annee_debut","programme"))
  rawdatatarget$etudiantdata4 <- subset(rawdatatarget$etudiantdata4,select = c("prenom_nom","prenom","nom","region_administrative","regime_coop","formation_prealable","annee_debut","programme"))
  rawdatatarget$etudiantdata9 <- subset(rawdatatarget$etudiantdata9,select = c("prenom_nom","prenom","nom","region_administrative","regime_coop","formation_prealable","annee_debut","programme"))
  rawdatatarget$etudiantdata7 <- subset(rawdatatarget$etudiantdata7,select = c("prenom_nom","prenom","nom","region_administrative","regime_coop","formation_prealable","annee_debut","programme"))
  
  #on unie les tableaux
  etudiantdata<- rbind(rawdatatarget$etudiantdata1,rawdatatarget$etudiantdata2,rawdatatarget$etudiantdata3,rawdatatarget$etudiantdata4,rawdatatarget$etudiantdata5,rawdatatarget$etudiantdata6,rawdatatarget$etudiantdata7,rawdatatarget$etudiantdata8,rawdatatarget$etudiantdata9,rawdatatarget$etudiantdata10)
  
  
  #on transforme en TRUE et FALSE avec gsub
  
  etudiantdata$regime_coop <- gsub("FAUX", "FALSE", etudiantdata$regime_coop)
  etudiantdata$regime_coop <- gsub("VRAI", "TRUE", etudiantdata$regime_coop)
  
  
  #Enlever les lignes qui nous interesse pas pour la table étudiant
  etudiant<-unique(etudiantdata)
  nomrow<-seq(1,227,1)
  
  row.names(etudiant)<-nomrow
  
  # Spécification des valeurs à supprimer
  ligness_a_supprimer <- c("216","82", "207", "94","23", "196", "31", "120", "67","173", "122", "195"
                           , "206", "99","68", "55", "197", "16", "133","123", "71", "208"
                           , "72", "59","104", "117", "141", "184", "8","76", "114", "106"
                           , "29", "211","77", "169", "107", "78", "64","209", "10", "20"
                           , "52", "80","18", "81", "82", "19", "125","61", "83", "84"
                           , "38", "124","17", "86", "12", "54", "87","26", "88", "226"
                           , "90", "161","227", "11", "58", "63", "145","162","153","200")
  
  lignes_a_supprimer <- as.integer(ligness_a_supprimer)
  
  # Suppression des lignes spécifiées
  Students <- etudiant[-lignes_a_supprimer,]
  
  #redonner les bons numéros de ligne selon le nouveau nombre de ligne
  nomrow2<-seq(1,156,1)
  row.names(Students)<-nomrow2
  
  #Correction des différentes lignes du tableau student
  Students[17, ] <- c("kayla_trempe-kay",
                      "kayla",
                      "trempe_kay",
                      "lanaudiere",
                      "TRUE",
                      "preuniversitaire",
                      "A2020",
                      "269000")
  
  Students[40, ] <- c("penelope_robert",
                      "penelope",
                      "robert",
                      NA,
                      NA,
                      NA,
                      NA,
                      NA)
  
  Students[86, ] <- c("eve_dandonneau",
                      "eve",
                      "dandonneau",
                      NA,
                      NA,
                      NA,
                      NA,
                      NA)
  
  Students[115, ] <- c("charles_ferland",
                       "charles",
                       "ferland",
                       "estrie",
                       "TRUE",
                       "preuniversitaire",
                       "A2020",
                       "269000")
  
  Students[65, ] <- c("marie-christine_arseneau",
                      "marie-christine",
                      "arseneau",
                      "gaspesie_iles_de_la_madeleine",
                      "TRUE",
                      "preuniversitaire",
                      "A2020",
                      "269000")
  
  Students[67, ] <- c("roxanne_bernier",
                      "roxanne",
                      "bernier",
                      "estrie",
                      "TRUE",
                      "preuniversitaire",
                      "A2020",
                      "269000")
  
  
  Students[149, ] <- c("catherine_viel-lapointe",
                       "catherine",
                       "viel-lapointe",
                       NA,
                       NA,
                       NA,
                       NA,
                       NA)
  
  Students[118, ] <- c("louis-philippe_raymond",
                       "louis-philippe",
                       "raymond",
                       NA,
                       NA,
                       NA,
                       NA,
                       NA)
  
  Students[94, ] <- c("laurianne_plante",
                      "laurianne",
                      "plante",
                      NA,
                      NA,
                      NA,
                      NA,
                      NA)
  
  
  #Ajouter des étudiants qui se rerouvent dans le fichier collaboration et pas dans le ficheier etudiant:
  #karim_hamzaoui, eloise_bernier, naomie_morin, gabrielle_moreault,maxence_comyn, maude_viens
  
  nouvelles_lignes <- data.frame(prenom_nom = c("karim_hamzaoui", "eloise_bernier","naomie_morin", "gabrielle_moreault","maxence_comyn", "maude_viens"), 
                                 prenom=c("karim", "eloise","naomie", "gabrielle","maxence", "maude"),
                                 nom = c("hamzaoui", "bernier","morin", "moreault","comyn", "viens"),region_administrative=NA,regime_coop=NA,formation_prealable=NA,annee_debut=NA,programme=NA)
  
  #rajouter les nouvelles lignes
  Students <- rbind(Students, nouvelles_lignes)
  
  #redonner les bons numéros de ligne selon le nouveau nombre de ligne
  
  nomrow3<-seq(1,162,1)
  row.names(Students)<-nomrow3
  
  # Écriture de la table filtrée dans un nouveau fichier
  pathe<- file.path("data","clean","clean_etudiant.csv")
  write.csv(Students,pathe, row.names = F)
  rm(list = ls())
  
  pathe<- file.path("data","clean","clean_etudiant.csv")
  etudiant<<-read.csv(file= pathe,sep = ",")
  rm(pathe)
  
  library(RSQLite)
  con <- dbConnect(SQLite(), dbname="reseau.db")
  dbWriteTable(con, append = TRUE, name = "etudiant", value = etudiant, row.names = FALSE)
  rm(con)
  
  return(etudiant)
  
  }
