figurer<- function(requete){
  
  #Chargement des data frames provenant de requete
  inter<-requete[[1]]
  resultat<-requete[[2]]
  
  ##Créaction des trois figures
  
  #Création du réseau (figure 1)
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
  
  #Définir l'épaisseur des bords en fonction du nombre d'intéraction entre les noeuds et changer la couleur pour noir
  edge_colors <- c("black")
  
  edge_width <- rescale(inter$nb_interaction, to = c(0.05,2))
  
  E(g)$width <- edge_width
  
  # Calculer la centralité de degré
  ec <- eigen_centrality(g)$vector
  
  
  
  #Mettre les données de centralités dans un data frame
  donnecentralite <- data.frame(nom = names(ec), centralite = ec)
  
  #combiner le tableau de centralité et le tableau resultat contenant les informations des étudiants 
  infotab <- merge(resultat, donnecentralite, by.x = "prenom_nom", by.y = "nom")
  
  listfigure<-list(infotab, ec, g)
  return(listfigure)
}