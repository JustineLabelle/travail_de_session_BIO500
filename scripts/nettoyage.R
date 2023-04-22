
#fonction qui nettoye les données

nettoyage <- function(allFiles) {
  
  #allFiles <- dir('path')
  
  # Tables à fusioner
  tabNames <- c('collaboration', 'cours', 'etudiant')
  
  # Nombre de groupes
  nbGroupe <- length(grep(tabNames[1], allFiles))
  
  # Charger les donnees
  for(tab in tabNames) {
    # prendre seulement les fichers de la table specifique tab
    tabFiles <- allFiles[grep(tab, allFiles)]
    
    for(groupe in 1:nbGroupe) {
      # Definir le nom de l'obj dans lequel sauver les donnees de la table tab du groupe groupe
      tabName <- paste0(tab, "data", groupe)
      
      # Avant  de charger les données, il faut savoir c'est quoi le séparateur utilisé car
      # il y a eu des données separées par "," et des autres separes par ";"
      ficher <- paste0('data/raw/', tabFiles[groupe])
      L <- readLines(ficher, n = 1) # charger première ligne du donnée
      separateur <- ifelse(grepl(';', L), ';', ',') # S'il y a un ";", separateur est donc ";"
      
      # charger le donnée avec le bon séparateur et donner le nom tabName
      assign(tabName, read.csv(ficher, sep = separateur, stringsAsFactors = FALSE, na.strings=c(""," ","NA")))
      
    }
  }
  #Utiliser subset pour selectionner seulememnt les colonnes interessante
  
  collaborationdata7 <- subset(collaborationdata7,select = c("etudiant1","etudiant2","sigle","session"))
  
  #on unie les tableaux
  collaborationdata<- rbind(collaborationdata1, collaborationdata2, collaborationdata3, collaborationdata4, collaborationdata5, collaborationdata6, collaborationdata7, collaborationdata8, collaborationdata9, collaborationdata10)
  
  #pour enlever les lignes doublons
  
  collaborationdata_unique<-unique(collaborationdata)
  collaborationdata_unique1<-subset(collaborationdata_unique,complete.cases(collaborationdata_unique$etudiant1))
  
  #Correction fautes de francais du tableau collaboration avec la fonction gsub
  
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub(" ", "%", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("ariane_barette", "ariane_barrette", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("philippe_barette", "philippe_barrette", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("catherine_viel_lapointe", "catherine_viel-lapointe", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("marie_christine_arseneau", "marie-christine_arseneau", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("francis_bolly", "francis_boily", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("francis_bourrassa", "francis_bourassa", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("frederick_laberge", "frederic_laberge", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("ihuoma_elsie_ebere", "ihuoma_elsie-ebere", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("jonathan_rondeau_leclaire", "jonathan_rondeau-leclaire", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("justine_lebelle", "justine_labelle", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("laurie_anne_coursnoyer", "laurie-anne_coursnoyer", x)
  }))
  
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("mael_guerin", "mael_gerin", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("marie_eve_gagne", "marie-eve_gagne", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("noemie_perrier-mallette", "noemie_perrier-malette", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("peneloppe_robert", "penelope_robert", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("arianne_barette", "ariane_barrette", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("phillippe_bourassa", "philippe_bourrassa", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("raphael_charlesbois", "raphael_charlebois", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("sabrica_leclercq", "sabrina_leclercq", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("sara_jade_lamontagne", "sara-jade_lamontagne", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("savier_samson", "xavier_samson", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("yannick_sagneau", "yanick_sageau", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("yannick_sageau", "yanick_sageau", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("yannick_sageau", "yanick_sageau", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("yanick_sagneau", "yanick_sageau", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("juliette_meilleur<a0>", "juliette_meilleur", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("mia_carriere<a0>", "mia_carriere", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("laurianne_plante%", "laurianne_plante", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("INS154%", "INS154", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("eve<a0>_dandonneau", "eve_dandonneau", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("eve<a0>_dandonneau", "eve_dandonneau", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("philippe_bourrassa", "philippe_bourassa", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("philippe_leonard_dufour", "philippe_leonard-dufour", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("edouard_nadon-baumier", "edouard_nadon-beaumier", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("cassandra_gobin", "cassandra_godin", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("louis-phillippe_theriault", "louis-philippe_theriault", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("louis_philippe_raymond", "louis-philippe_raymond", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("amelie_harbeck_bastien", "amelie_harbeck-bastien", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("marie_burghin", "marie_bughin", x)
  }))
  collaborationdata_unique1 <- data.frame(lapply(collaborationdata_unique1, function(x) {
    gsub("madyson_mcclean", "madyson_mclean", x)
  }))
  
  #Enlever les collaborations où un étudiant collabore avec lui même
  collaborationdata_unique1 <- collaborationdata_unique1[collaborationdata_unique1$etudiant1 != collaborationdata_unique1$etudiant2, ]
  
  #Vérifier si collaborationdata_unique1 est un dataframe
  class(collaborationdata_unique1)
  
  
  # Écriture de la table filtrée dans un nouveau fichier
  pathcoll<- file.path("data","clean","clean_collaboration.csv")
  write.csv(collaborationdata_unique1, pathcoll, row.names = F)
  
  #Créer un l'objet collaboration qui sera retourné
  pathcoll<- file.path("data","clean","clean_collaboration.csv")
  collaborations<-read.csv(file= pathcoll,sep = ",")
  collaborations<-unique(collaborations)
  
  #Utiliser subset pour selectionner seulememnt les colonnes interessante
  
  coursdata5 <- subset(coursdata5,select = c("sigle","optionnel","credits"))
  coursdata7 <- subset(coursdata7,select = c("sigle","optionnel","credits"))
  
  
  ##changer le seul nom de colonne différent des autres pour courss
  names(coursdata4)[names(coursdata4) == "ï..sigle"] <- "sigle"
  
  
  #on unie les tableaux
  coursdata<- rbind(coursdata1,coursdata2,coursdata3,coursdata4,coursdata5,coursdata6,coursdata7,coursdata8,coursdata9,coursdata10)
  
  
  #pour enlever les lignes doublons
  
  coursdata_unique<-unique(coursdata)
  coursdata_unique1<-subset(coursdata_unique,complete.cases(coursdata_unique$sigle))
  
  
  # Nettoyage table courss
  coursdata_unique1$optionnel <- gsub("FAUX", "FALSE", coursdata_unique1$optionnel)
  coursdata_unique1$optionnel <- gsub("VRAI", "TRUE", coursdata_unique1$optionnel)
  coursdata_unique1 <- na.omit(coursdata_unique1)
  coursdata_unique1 <- data.frame(lapply(coursdata_unique1, function(x) {
    gsub("BIO400", "BOT400", x)
  }))
  coursdata_unique1$credits <- ifelse(coursdata_unique1$sigle == "BIO109", 1, coursdata_unique1$credits)
  coursdata_unique1$credits <- ifelse(coursdata_unique1$sigle == "BOT400", 1, coursdata_unique1$credits)
  coursdata_unique1$credits <- ifelse(coursdata_unique1$sigle == "ECL515", 2, coursdata_unique1$credits)
  coursdata_unique1$credits <- ifelse(coursdata_unique1$sigle == "TSB303", 2, coursdata_unique1$credits)
  coursdata_unique1$optionnel <- ifelse(coursdata_unique1$sigle == "BCM113", FALSE, coursdata_unique1$optionnel)
  coursdata_unique1$optionnel <- ifelse(coursdata_unique1$sigle == "BIO401", TRUE, coursdata_unique1$optionnel)
  coursdata_unique1$optionnel <- ifelse(coursdata_unique1$sigle == "ECL215", FALSE, coursdata_unique1$optionnel)
  coursdata_unique1$optionnel <- ifelse(coursdata_unique1$sigle == "ECL315", TRUE, coursdata_unique1$optionnel) 
  coursdata_unique1$optionnel <- ifelse(coursdata_unique1$sigle == "ECL406", TRUE, coursdata_unique1$optionnel) 
  coursdata_unique1$optionnel <- ifelse(coursdata_unique1$sigle == "ECL522", TRUE, coursdata_unique1$optionnel) 
  coursdata_unique1$optionnel <- ifelse(coursdata_unique1$sigle == "ECL527", FALSE, coursdata_unique1$optionnel)
  coursdata_unique1$optionnel <- ifelse(coursdata_unique1$sigle == "ECL544", TRUE, coursdata_unique1$optionnel)
  coursdata_unique1$optionnel <- ifelse(coursdata_unique1$sigle == "ECL610", FALSE, coursdata_unique1$optionnel)
  coursdata_unique1$optionnel <- ifelse(coursdata_unique1$sigle == "ECL611", FALSE, coursdata_unique1$optionnel)
  coursdata_unique1$optionnel <- ifelse(coursdata_unique1$sigle == "TSB303", FALSE, coursdata_unique1$optionnel)
  coursdata_unique1$optionnel <- ifelse(coursdata_unique1$sigle == "ZOO304", TRUE, coursdata_unique1$optionnel)
  
  #faire en sorte que les lignes sont uniques
  cours<-unique(coursdata_unique1)
  cours_clean<- cours[-36, ]
  
  # Écriture de la table filtrée dans un nouveau fichier
  pathcours<- file.path("data","clean","clean_cours.csv")
  write.csv(cours_clean, pathcours,row.names = F)

  #Créer l'objet courss pour le retourner
  pathcours<- file.path("data","clean","clean_cours.csv")
  cours<-read.csv(file= pathcours,sep = ",")
  rm(pathcours)
  
  ##changer le seul nom de colonne différent des autres pour Étudiant
  
  names(etudiantdata4)[names(etudiantdata4) == "prenom_nom."] <- "prenom_nom"
  
  #Utiliser subset pour selectionner seulememnt les colonnes interessante
  
  etudiantdata3 <- subset(etudiantdata3,select = c("prenom_nom","prenom","nom","region_administrative","regime_coop","formation_prealable","annee_debut","programme"))
  etudiantdata4 <- subset(etudiantdata4,select = c("prenom_nom","prenom","nom","region_administrative","regime_coop","formation_prealable","annee_debut","programme"))
  etudiantdata9 <- subset(etudiantdata9,select = c("prenom_nom","prenom","nom","region_administrative","regime_coop","formation_prealable","annee_debut","programme"))
  etudiantdata7 <- subset(etudiantdata7,select = c("prenom_nom","prenom","nom","region_administrative","regime_coop","formation_prealable","annee_debut","programme"))
  
  #on unie les tableaux
  etudiantdata<- rbind(etudiantdata1,etudiantdata2,etudiantdata3,etudiantdata4,etudiantdata5,etudiantdata6,etudiantdata7,etudiantdata8,etudiantdata9,etudiantdata10)
  
  
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
  
  # créer objet etudiant qui sort à la fin
  pathe<- file.path("data","clean","clean_etudiant.csv")
  etudiant<-read.csv(file= pathe,sep = ",")
  # nettoyer environnement
  rm(pathe)
  rm(list = setdiff(ls(), c("collaborations", "cours", "etudiant")))
  
  #liste d'objet à sortir
  liste<-list(collaborations, cours, etudiant)
 
  #retourner la liste
   return(liste) 
}
