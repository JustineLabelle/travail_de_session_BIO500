manipulations <- function(rawdata) {
##Requetes SQL
library(RSQLite)
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
     vertex.frame.color = NA, vertex.size = 4, 
     vertex.label.cex = 0,4, layout = layout.kamada.kawai(g))
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

#colnames(cent)<-"prenom_nom"
#cente<-data.frame(etudiant[,1])
#colnames(cente)<-"prenom_nom"

#extra_ids <- setdiff(cent,cente)
#extra_ids

#extra_idss <- setdiff(cente,cent)
#extra_idss 

##ajouté a etudiant karim_hamzaoui, eloise_bernier, naomie_morin, gabrielle_moreault,maxence_comyn,maude_viens
}