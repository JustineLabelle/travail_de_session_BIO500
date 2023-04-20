figurer2<- function(requete){
  
  #Chargement des data frames provenant de requete
  inter<-requete[[1]]
  resultat<-requete[[2]]
  
  #-------------------------------
  #Création du graphique violon de la centralité selon la session de dénut de programme (figure 2)
  
  # Charger le package igraph
  library(igraph)
  
  # Créer un objet graph à partir des données de la requête SQL inter
  graph <- graph.data.frame(inter, directed = TRUE)
  
  # Convertir le graph en une matrice contenant toutes les différentes intérractions
  matrice <- as.matrix(get.adjacency(graph))
  
  
  # Ajouter les noms des étudiants comme noms de lignes et de colonnes pas certain que c'est utile
  #(binary_matrix) <- rownames(binary_matrix) <- V(graph)$name
  
  #Créer un objet igraph
  g<-graph.adjacency(matrice)
  
  library(scales)
  
  edge_width <- rescale(inter$nb_interaction, to = c(0.05,2))
  
  E(g)$width <- edge_width
  
  # Calculer la centralité de degré
  ec <- eigen_centrality(g)$vector
  
  #Mettre les données de centralités dans un data frame
  donnecentralite <- data.frame(nom = names(ec), centralite = ec)
  
  #combiner le tableau de centralité et le tableau resultat contenant les informations des étudiants 
  infotab <- merge(resultat, donnecentralite, by.x = "prenom_nom", by.y = "nom")
  
  #charger le package vioplot
  library(vioplot)
  
  #definir les classe des années de début 
  infotab$annee_debut <- factor(infotab$annee_debut, levels = c("H2019", "A2019", "H2020", "A2020", "E2021", "A2021", "H2022","A2022", "NA"))
  #Faire en sorte que les données absente soit observer dans les figures
  infotab$annee_debut[is.na(infotab$annee_debut)] <- "NA"
  
  png("figures/figure2.png",width = 1920, height = 1080,res=96)
  # faire le violin plot
  par(mfrow=c(1,1), mar=c(8, 4, 4, 3))
  vioplot(centralite ~ annee_debut, data = infotab, col = "#CCE5FF", border= "#99CCFF", xlab= "Session de début", ylab = "Coefficient de centralité", yaxs="i", cex.lab = 1.5, cex.axis = 1.5)
  #mettre les points dans la figure
  points(infotab$annee_debut, infotab$centralite, col = "#CC79A7")
  #mettre un titre à la figure
  #mtext("Figure 2 : Distribution de la centralité selon la session de début de programme.", side = 1, line = 4, col = "black", font = 2, cex = 2, adj = 0, padj = 2)
  # Fermer le fichier PNG
  dev.off()
  
}