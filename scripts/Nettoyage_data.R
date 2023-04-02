#-----------------------------------------------------
# 1. Charger les données
#
# Assumant que les données sont sauvées dans le 
# sous-répertoire data/raw
#-----------------------------------------------------
#pénis
# Extraire le nom des fichers de chaque groupe

allFiles <- dir('data/raw/')

# Tables à fusioner
tabNames <- c('collaboration', 'cour', 'etudiant')

# Nombre de groupes
nbGroupe <- length(grep(tabNames[1], allFiles))

# Charger les donnees
for(tab in tabNames) {
  # prendre seulement les fichers de la table specifique `tab`
  tabFiles <- allFiles[grep(tab, allFiles)]
  
  for(groupe in 1:nbGroupe) {
    # Definir le nom de l'obj dans lequel sauver les donnees de la table `tab` du groupe `groupe`
    tabName <- paste0(tab, "data", groupe)
    
    # Avant  de charger les données, il faut savoir c'est quoi le séparateur utilisé car
    # il y a eu des données separées par "," et des autres separes par ";"
    ficher <- paste0('data/raw/', tabFiles[groupe])
    L <- readLines(ficher, n = 1) # charger première ligne du donnée
    separateur <- ifelse(grepl(';', L), ';', ',') # S'il y a un ";", separateur est donc ";"
    
    # charger le donnée avec le bon séparateur et donner le nom `tabName`
    assign(tabName, read.csv(ficher, sep = separateur, stringsAsFactors = FALSE))
    
  }
}

# nettoyer des objets temporaires utilisé dans la boucle
rm(list = c('allFiles', 'tab', 'tabFiles', 'tabName', 'ficher', 'groupe'))


#-----------------------------------------------------
# 2.

##Vérification des noms des colonnes

all.equal(names(courdata1),names(courdata2),names(courdata3),names(courdata4),names(courdata5),names(courdata6),names(courdata7),names(courdata8),names(courdata9),names(courdata10))
all.equal(names(collaborationdata1),names(collaborationdata2),names(collaborationdata3),names(collaborationdata4),names(collaborationdata5),names(collaborationdata6),names(collaborationdata7),names(collaborationdata8),names(collaborationdata9),names(collaborationdata10))
all.equal(names(etudiantdata1),names(etudiantdata2),names(etudiantdata3),names(etudiantdata4),names(etudiantdata5),names(etudiantdata6),names(etudiantdata7),names(etudiantdata8),names(etudiantdata9),names(etudiantdata10))

##changer le seul nom de colonne différent des autres
names(etudiantdata4)[names(etudiantdata4) == "prenom_nom."] <- "prenom_nom"

#Utiliser subset pour selectionner seulememnt les colonnes interessante

courdata5 <- subset(courdata5,select = c("sigle","optionnel","credits"))
courdata7 <- subset(courdata7,select = c("sigle","optionnel","credits"))

collaborationdata7 <- subset(collaborationdata7,select = c("etudiant1","etudiant2","sigle","session"))

etudiantdata3 <- subset(etudiantdata3,select = c("prenom_nom","prenom","nom","region_administrative","regime_coop","formation_prealable","annee_debut","programme"))
etudiantdata4 <- subset(etudiantdata4,select = c("prenom_nom","prenom","nom","region_administrative","regime_coop","formation_prealable","annee_debut","programme"))
etudiantdata9 <- subset(etudiantdata9,select = c("prenom_nom","prenom","nom","region_administrative","regime_coop","formation_prealable","annee_debut","programme"))
etudiantdata7 <- subset(etudiantdata7,select = c("prenom_nom","prenom","nom","region_administrative","regime_coop","formation_prealable","annee_debut","programme"))

#on unie les tableaux
courdata<- rbind(courdata1,courdata2,courdata3,courdata4,courdata5,courdata6,courdata7,courdata8,courdata9,courdata10)
collaborationdata<- rbind(collaborationdata1,collaborationdata2,collaborationdata3,collaborationdata4,collaborationdata5,collaborationdata6,collaborationdata7,collaborationdata8,collaborationdata9,collaborationdata10)
etudiantdata<- rbind(etudiantdata1,etudiantdata2,etudiantdata3,etudiantdata4,etudiantdata5,etudiantdata6,etudiantdata7,etudiantdata8,etudiantdata9,etudiantdata10)

#pour enlever les lignes doublons
etudiantdata_unique<-unique(etudiantdata)
courdata_unique<-unique(courdata)
collaborationdata_unique<-unique(collaborationdata)

etudiantdata_unique1<-subset(etudiantdata_unique,complete.cases(etudiantdata_unique$prenom_nom))
courdata_unique1<-subset(courdata_unique,complete.cases(courdata_unique$sigle))
collaborationdata_unique1<-subset(collaborationdata_unique,complete.cases(collaborationdata_unique$etudiant1))

1.#Correction fautes de francais collaboration

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
  gsub("laurie_anne_cournoyer", "laurie-anne_cournoyer", x)
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


class(collaborationdata_unique1)

library(stringr)

2.#Enlever les lignes qui nous interesse pas pour la table étudiant
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
                         , "90", "161","227", "11", "58", "63", "145","163", "152")

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
write.csv(Students, "clean_etudiant.csv", row.names = T,col.names = T)


3.# Nettoyage table cours
courdata_unique1$optionnel <- gsub("FALSE", "FAUX", courdata_unique1$optionnel)
courdata_unique1$optionnel <- gsub("TRUE", "VRAI", courdata_unique1$optionnel)
courdata_unique1 <- na.omit(courdata_unique1)
courdata_unique1 <- data.frame(lapply(courdata_unique1, function(x) {
  gsub("BIO400", "BOT400", x)
}))
courdata_unique1$credits <- ifelse(courdata_unique1$sigle == "BIO109", 1, courdata_unique1$credits)
courdata_unique1$credits <- ifelse(courdata_unique1$sigle == "BOT400", 1, courdata_unique1$credits)
courdata_unique1$credits <- ifelse(courdata_unique1$sigle == "ECL515", 2, courdata_unique1$credits)
courdata_unique1$credits <- ifelse(courdata_unique1$sigle == "TSB303", 2, courdata_unique1$credits)
courdata_unique1$optionnel <- ifelse(courdata_unique1$sigle == "BCM113", FAUX, courdata_unique1$optionnel)
courdata_unique1$optionnel <- ifelse(courdata_unique1$sigle == "BIO401", VRAI, courdata_unique1$optionnel)
courdata_unique1$optionnel <- ifelse(courdata_unique1$sigle == "ECL215", FAUX, courdata_unique1$optionnel)
courdata_unique1$optionnel <- ifelse(courdata_unique1$sigle == "ECL315", VRAI, courdata_unique1$optionnel) #MICROPROGRAMME
courdata_unique1$optionnel <- ifelse(courdata_unique1$sigle == "ECL406", VRAI, courdata_unique1$optionnel) #microprogramme
courdata_unique1$optionnel <- ifelse(courdata_unique1$sigle == "ECL522", VRAI, courdata_unique1$optionnel) 
courdata_unique1$optionnel <- ifelse(courdata_unique1$sigle == "ECL527", FAUX, courdata_unique1$optionnel)
courdata_unique1$optionnel <- ifelse(courdata_unique1$sigle == "ECL544", VRAI, courdata_unique1$optionnel)
courdata_unique1$optionnel <- ifelse(courdata_unique1$sigle == "ECL610", FAUX, courdata_unique1$optionnel)
courdata_unique1$optionnel <- ifelse(courdata_unique1$sigle == "ECL611", FAUX, courdata_unique1$optionnel)
courdata_unique1$optionnel <- ifelse(courdata_unique1$sigle == "TSB303", FAUX, courdata_unique1$optionnel)
courdata_unique1$optionnel <- ifelse(courdata_unique1$sigle == "ZOO304", VRAI, courdata_unique1$optionnel)


cour<-unique(courdata_unique1)

# Écriture de la table filtrée dans un nouveau fichier
write.csv(cour, "clean_cour.csv", row.names = T,col.names = T)

#-----------------------------------------------------

