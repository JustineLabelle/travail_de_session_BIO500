#-----------------------------------------------------
# 1. Charger les données
#
# Assumant que les données sont sauvées dans le 
# sous-répertoire data/raw
#-----------------------------------------------------

# Extraire le nom des fichers de chaque groupe

library(RSQLite)
con <- dbConnect(SQLite(), dbname="reseau.db")

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
    assign(tabName, read.csv(ficher, sep = separateur, stringsAsFactors = FALSE, na.strings=c(""," ","NA")))
    
  }
}

# nettoyer des objets temporaires utilisé dans la boucle
rm(list = c('allFiles', 'tab', 'tabFiles', 'tabName', 'ficher', 'groupe'))


#-----------------------------------------------------
# 2. On nettoye collaborations en premier


#Utiliser subset pour selectionner seulememnt les colonnes interessante

collaborationdata7 <- subset(collaborationdata7,select = c("etudiant1","etudiant2","sigle","session"))

#on unie les tableaux
collaborationdata<- rbind(collaborationdata1,collaborationdata2,collaborationdata3,collaborationdata4,collaborationdata5,collaborationdata6,collaborationdata7,collaborationdata8,collaborationdata9,collaborationdata10)

#pour enlever les lignes doublons

collaborationdata_unique<-unique(collaborationdata)
collaborationdata_unique1<-subset(collaborationdata_unique,complete.cases(collaborationdata_unique$etudiant1))

1.#Correction fautes de francais collaboration
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

collaborationdata_unique1 <- collaborationdata_unique1[collaborationdata_unique1$etudiant1 != collaborationdata_unique1$etudiant2, ]

class(collaborationdata_unique1)

library(stringr)

# Écriture de la table filtrée dans un nouveau fichier
pathcoll<- file.path("data","clean","clean_collaboration.csv")
write.csv(collaborationdata_unique1, pathcoll, row.names = F,col.names = T)

#-----------------------------------------------------
# 3. On nettoye Étudiant ici

##changer le seul nom de colonne différent des autres pour Étudiant

names(etudiantdata4)[names(etudiantdata4) == "prenom_nom."] <- "prenom_nom"

#Utiliser subset pour selectionner seulememnt les colonnes interessante

etudiantdata3 <- subset(etudiantdata3,select = c("prenom_nom","prenom","nom","region_administrative","regime_coop","formation_prealable","annee_debut","programme"))
etudiantdata4 <- subset(etudiantdata4,select = c("prenom_nom","prenom","nom","region_administrative","regime_coop","formation_prealable","annee_debut","programme"))
etudiantdata9 <- subset(etudiantdata9,select = c("prenom_nom","prenom","nom","region_administrative","regime_coop","formation_prealable","annee_debut","programme"))
etudiantdata7 <- subset(etudiantdata7,select = c("prenom_nom","prenom","nom","region_administrative","regime_coop","formation_prealable","annee_debut","programme"))

#on unie les tableaux
etudiantdata<- rbind(etudiantdata1,etudiantdata2,etudiantdata3,etudiantdata4,etudiantdata5,etudiantdata6,etudiantdata7,etudiantdata8,etudiantdata9,etudiantdata10)

#on transforme en TRUE et FALSE
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

nomrow2<-seq(1,156,1)
row.names(Students)<-nomrow2

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


##Ajouter des étudiantsqui se rerouve dans le fichier collaboration et pas dans le ficheier etudiant:
#karim_hamzaoui, eloise_bernier, naomie_morin, gabrielle_moreault,maxence_comyn,maude_viens

nouvelles_lignes <- data.frame(prenom_nom = c("karim_hamzaoui", "eloise_bernier","naomie_morin", "gabrielle_moreault","maxence_comyn", "maude_viens"), 
                               prenom=c("karim", "eloise","naomie", "gabrielle","maxence", "maude"),
                               nom = c("hamzaoui", "bernier","morin", "moreault","comyn", "viens"),region_administrative=NA,regime_coop=NA,formation_prealable=NA,annee_debut=NA,programme=NA)


Students <- rbind(Students, nouvelles_lignes)

nomrow3<-seq(1,162,1)
row.names(Students)<-nomrow3

# Écriture de la table filtrée dans un nouveau fichier
pathe<- file.path("data","clean","clean_etudiant.csv")
write.csv(Students,pathe, row.names = F,col.names = T)

#-----------------------------------------------------
# 3. On nettoye cour ici

#Utiliser subset pour selectionner seulememnt les colonnes interessante

courdata5 <- subset(courdata5,select = c("sigle","optionnel","credits"))
courdata7 <- subset(courdata7,select = c("sigle","optionnel","credits"))


##changer le seul nom de colonne différent des autres pour cours
names(courdata4)[names(courdata4) == "ï..sigle"] <- "sigle"


#on unie les tableaux
courdata<- rbind(courdata1,courdata2,courdata3,courdata4,courdata5,courdata6,courdata7,courdata8,courdata9,courdata10)


#pour enlever les lignes doublons

courdata_unique<-unique(courdata)
courdata_unique1<-subset(courdata_unique,complete.cases(courdata_unique$sigle))


# Nettoyage table cours
courdata_unique1$optionnel <- gsub("FAUX", "FALSE", courdata_unique1$optionnel)
courdata_unique1$optionnel <- gsub("VRAI", "TRUE", courdata_unique1$optionnel)
courdata_unique1 <- na.omit(courdata_unique1)
courdata_unique1 <- data.frame(lapply(courdata_unique1, function(x) {
  gsub("BIO400", "BOT400", x)
}))
courdata_unique1$credits <- ifelse(courdata_unique1$sigle == "BIO109", 1, courdata_unique1$credits)
courdata_unique1$credits <- ifelse(courdata_unique1$sigle == "BOT400", 1, courdata_unique1$credits)
courdata_unique1$credits <- ifelse(courdata_unique1$sigle == "ECL515", 2, courdata_unique1$credits)
courdata_unique1$credits <- ifelse(courdata_unique1$sigle == "TSB303", 2, courdata_unique1$credits)
courdata_unique1$optionnel <- ifelse(courdata_unique1$sigle == "BCM113", FALSE, courdata_unique1$optionnel)
courdata_unique1$optionnel <- ifelse(courdata_unique1$sigle == "BIO401", TRUE, courdata_unique1$optionnel)
courdata_unique1$optionnel <- ifelse(courdata_unique1$sigle == "ECL215", FALSE, courdata_unique1$optionnel)
courdata_unique1$optionnel <- ifelse(courdata_unique1$sigle == "ECL315", TRUE, courdata_unique1$optionnel) 
courdata_unique1$optionnel <- ifelse(courdata_unique1$sigle == "ECL406", TRUE, courdata_unique1$optionnel) 
courdata_unique1$optionnel <- ifelse(courdata_unique1$sigle == "ECL522", TRUE, courdata_unique1$optionnel) 
courdata_unique1$optionnel <- ifelse(courdata_unique1$sigle == "ECL527", FALSE, courdata_unique1$optionnel)
courdata_unique1$optionnel <- ifelse(courdata_unique1$sigle == "ECL544", TRUE, courdata_unique1$optionnel)
courdata_unique1$optionnel <- ifelse(courdata_unique1$sigle == "ECL610", FALSE, courdata_unique1$optionnel)
courdata_unique1$optionnel <- ifelse(courdata_unique1$sigle == "ECL611", FALSE, courdata_unique1$optionnel)
courdata_unique1$optionnel <- ifelse(courdata_unique1$sigle == "TSB303", FALSE, courdata_unique1$optionnel)
courdata_unique1$optionnel <- ifelse(courdata_unique1$sigle == "ZOO304", TRUE, courdata_unique1$optionnel)


cour<-unique(courdata_unique1)
cour_clean<- cour[-36, ]

# Écriture de la table filtrée dans un nouveau fichier
pathcour<- file.path("data","clean","clean_cour.csv")
write.csv(cour_clean, pathcour,row.names = F,col.names = T)



### On vide l'environnement et on recharge les documents fraichement nettoyés pour commencer le travail du bon pied

rm(list = ls())
library(RSQLite)
con <- dbConnect(SQLite(), dbname="reseau.db")

pathe<- file.path("data","clean","clean_etudiant.csv")
pathcour<- file.path("data","clean","clean_cour.csv")
pathcoll<- file.path("data","clean","clean_collaboration.csv")

etudiant<-read.csv(file=pathe,sep = ",")
cours<-read.csv(file=pathcour, sep = ",")
collaborations<-read.csv(file= pathcoll,sep = ",")

#----------------------------------------------------------------------------------------------------------
##Requetes SQL

con <- dbConnect(SQLite(), dbname="reseau.db")

dbExecute(con,"DROP TABLE etudiant;")
dbExecute(con,"DROP TABLE collaborations;")
dbExecute(con,"DROP TABLE cours;")

dbWriteTable(con, append = TRUE, name = "etudiant", value = etudiant, row.names = FALSE)
dbWriteTable(con, append = TRUE, name = "collaborations", value = collaborations, row.names = FALSE)
dbWriteTable(con, append = TRUE, name = "cours", value = cours, row.names = FALSE)



requestcollab <- "
SELECT
  etudiant1 AS Auteur,count(etudiant1) AS nb_collab
FROM collaborations
GROUP BY etudiant1
ORDER BY nb_collab DESC;"

collab<- dbGetQuery(con,requestcollab)
head(collab)
collab


requestinter <- "
SELECT etudiant1 AS Ami1, etudiant2 AS Ami2, COUNT(*) AS nb_interaction
FROM collaborations
GROUP BY etudiant1, etudiant2
ORDER BY nb_interaction DESC
;"
inter<- dbGetQuery(con,requestinter)
inter



nbramis<-dbGetQuery(con, "SELECT count(DISTINCT etudiant1)FROM collaborations;")
nbramis
intobs<-sum(inter$nb_interaction)
intobs
intpsbl<-nbramis*(nbramis-1)/2
intpsbl
conectivite<-intobs/intpsbl
conectivite
meaninter<-mean(inter$nb_interaction)
meaninter
varinter<-var(inter$nb_interaction)
varinter





requestnodes<- "
SELECT *
FROM etudiant
;"
nodes<- dbGetQuery(con,requestnodes)
nodes

requestnedges<- "
SELECT etudiant1 AS Ami1, etudiant2 AS Ami2
FROM collaborations
;"
edges<- dbGetQuery(con,requestnedges)
edges

requestanne <- "
SELECT collaborations.etudiant1 AS Ami1, collaborations.etudiant2 AS Ami2, COUNT(*) AS nb_interaction, etudiant.annee_debut AS Année_début
FROM collaborations
FULL OUTER JOIN etudiant 
ON collaborations.etudiant1 = etudiant.prenom_nom 
GROUP BY etudiant1, etudiant2
ORDER BY nb_interaction DESC
;"
anne<- dbGetQuery(con,requestanne)
anne

requestpasse <- "
SELECT collaborations.etudiant1 AS Ami1, collaborations.etudiant2 AS Ami2, COUNT(*) AS nb_interaction, etudiant.formation_prealable AS Formation_Préalable
FROM collaborations
FULL OUTER JOIN etudiant 
ON collaborations.etudiant1 = etudiant.prenom_nom 
GROUP BY etudiant1, etudiant2
ORDER BY nb_interaction DESC
;"
passe<- dbGetQuery(con,requestpasse)
passe




#cent<-dbGetQuery(con, "SELECT DISTINCT etudiant1 FROM collaborations;")
#cent
# Charger le package igraph
library(igraph)

# Créer un objet graph à partir des données de la requête SQL
graph <- graph.data.frame(inter, directed = TRUE)

# Convertir le graph en une matrice d'adjacence
adj_matrix <- as.matrix(get.adjacency(graph))

# Convertir la matrice d'adjacence en une matrice binaire potentiellement pas utile
#binary_matrix <- ifelse(adj_matrix > 0, 1, 0)

# Ajouter les noms des étudiants comme noms de lignes et de colonnes pas certain que c'est utile
#(binary_matrix) <- rownames(binary_matrix) <- V(graph)$name

g<-graph.adjacency(adj_matrix)


plot(g, edge.arrow.mode = 0,
     vertex.frame.color = NA, vertex.size = 3, 
     vertex.label.cex = 0.5, layout = layout.kamada.kawai(g))


# Calculer la centralité de degré
deg_centrality <- eigen_centrality(g)

# Définir une palette de couleurs pour la centralité de degré
colors <- rev(heat.colors(max(deg_centrality)))

# Tracer le graphique avec les couleurs de nœuds correspondantes à la centralité de degré
plot(g, vertex.color = colors[deg_centrality], edge.arrow.mode = 0,
     vertex.frame.color = NA, vertex.size = 4, 
     vertex.label.cex = 0.4, layout = layout.kamada.kawai(g))



distances(g)
imponoeud<-eigen_centrality(g)$vector
sort(imponoeud, decreasing = TRUE)
wtc <- walktrap.community(g)

# Calcule la modularité à partir des communautés
modularity(wtc)
#trouver les cliques
cliques(g)
clique_size_counts(g)
clique_num(g)
max_cliques(g)

#centralité du reseau
eigen_centrality(g)$vector

# Évalue la présence communautés dans le graphe
wtc = walktrap.community(g)
# Calcule la modularité à partir des communautés
modularity(wtc)

#colnames(cent)<-"prenom_nom"
#cente<-data.frame(etudiant[,1])
#colnames(cente)<-"prenom_nom"

#extra_ids <- setdiff(cent,cente)
#extra_ids

#extra_idss <- setdiff(cente,cent)
#extra_idss 

##ajouté a etudiant karim_hamzaoui, eloise_bernier, naomie_morin, gabrielle_moreault,maxence_comyn,maude_viens


requestinter <- "
SELECT etudiant1 AS Ami1, etudiant2 AS Ami2, COUNT(*) AS nb_interaction
FROM collaborations
GROUP BY etudiant1, etudiant2
ORDER BY nb_interaction DESC
;"
inter<- dbGetQuery(con,requestinter)
inter

# Créer un objet graph à partir des données de la requête SQL
graph <- graph.data.frame(inter, directed = TRUE)

# Convertir le graph en une matrice d'adjacence
adj_matrix <- as.matrix(get.adjacency(graph))

g<-graph.adjacency(adj_matrix)

ec <- eigen_centrality(g)$vector

centrality_df <- data.frame(nom = names(ec), centralite = ec)


infotab <- merge(etudiant, centrality_df, by.x = "prenom_nom", by.y = "nom")



library(vioplot)

infotab$annee_debut <- factor(infotab$annee_debut)
levels(infotab$annee_debut) <- c(levels(infotab$annee_debut), "NA")
infotab$annee_debut[is.na(infotab$annee_debut)] <- "NA"


# Créer le violon plot
pos <- c("H2019", "A2019", "H2020", "A2020", "H2021", "A2021", "H2022")

vioplot(centralite ~ annee_debut, data = infotab, col = "blue")
points(infotab$annee_debut, infotab$centralite, col = "red")


barplot(centralite ~ formation_prealable, data = infotab, col = "blue")

