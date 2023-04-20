figurer1<- function(requete){
  #---------------------------------------------------------------------------------------------------------
 
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
  
  # Création de cinq classes de noeud selon leur valeur de centralité
  classes <- cut(ec, breaks = c(0, 0.1, 0.25, 0.5, 0.75, 1), labels = c("Class 1", "Class 2", "Class 3", "Class 4", "Class 5"))
  
  # Définir une palette de couleurs pour chacune des classes de degré de centralité
  colors_res <- c("#FFCC00", "#FF9900", "#FF6600", "#FF6699", "#CC0000")
  node_colors <- colors_res[as.numeric(classes)]
  
  # Définir une taille de noeud pour chacune des classes de degré de centralité
  sizes <- c(2, 3, 4, 5, 6)
  node_sizes <- sizes[as.numeric(classes)]
  
  png("figures/figure1.png",width = 1080, height = 1080,res=96)
  # Print le réseau selon les conditions définies
  #1.5, 1.5, 1.5, 1.5
  #par(mfrow=c(1,1), mar=c(1.5, 1.5, 1.5, 1.5))
  plot(g, edge.arrow.mode = 0,
               vertex.label = NA, layout = layout.kamada.kawai(g),
               vertex.shape = "circle", vertex.frame.color = "black",
               edge.width = E(g)$width,
               edge.color = edge_colors,
               vertex.color = node_colors,
               vertex.size = node_sizes)
  
  
  #mettre une légende pour les couleurs selon les classes
  legend(x = "right", y = "top", legend = c("Classe 1 : Faible centralité", "Classe 2", "Classe 3", "Classe 4", "Classe 5 : Forte centralité"), col = colors_res, pch = 16, cex = sizes, bty = "n",x.intersp = 0.5, y.intersp = 0.5)
  #mettre un titre au réseau
  mtext("Figure 1 : Réseau de collaborations des étudiants du cours BIO500 à l'hiver 2023.", side = 1, line = 4, col = "black", font = 2, cex = 0.6, adj = 0, padj = -10)
  
  
  dev.off()
  
  
}

