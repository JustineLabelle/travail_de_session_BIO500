figurer3<- function(requete){
  
  #Chargement des data frames provenant de requete
  inter<-requete[[1]]
  resultat<-requete[[2]]
  
  ##création du barplot de la moyenne de la centrallité selon la formation préalable (figure 3)
  
  
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
  
  
  # Faire en sorte que le bareplot prennes aussi les NA dans la figure
  infotab$formation_prealable <- factor(infotab$formation_prealable)
  levels(infotab$formation_prealable) <- c(levels(infotab$formation_prealable), "NA")
  infotab$formation_prealable[is.na(infotab$formation_prealable)] <- "NA"
  
  # Calculer la moyenne de centralité et l'écart type pour chaque catégorie de formation_prealable
  means <- aggregate(infotab$centralite, by = list(infotab$formation_prealable), FUN = mean)
  sd <- aggregate(infotab$centralite, by = list(infotab$formation_prealable), FUN = sd)
  
  
  # Definir les couleurs selon les formations préalable
  colors_bar <- colorRampPalette(c("#009966", "#0072B2", "#D55E00", "#CC79A7"))
  
  # Définir le nom, le chemin d'accès et la résolution du fichier PNG
  png("figures/figure3.png",width = 1920, height = 1080,res=96)
  
  # Créer le diagramme en barres avec les moyennes de centralité
  par(mfrow=c(1,1), mar=c(8, 4, 4, 3))
  barplot(height = means$x, names.arg = means$Group.1, col = colors_bar(length(means$x)), xlab = "Formation préalable", ylab = "Moyenne de centralité", ylim= c(0,1), cex.axis =1.2 ,cex.lab=1.5)
  #mettre les bandes d'écart type
  arrows(x0=barplot(height = means$x, plot=FALSE), y0=means$x-sd$x, x1=barplot(height = means$x, plot=FALSE), y1=means$x+sd$x, angle=90, code=3, length=0.1)
  #mettre un titre à la figure
  #mtext("Figure 3 : Moyenne de centralité par formation préalable.", side = 1, line = 4, col = "black", font = 2, cex = 2, adj = 0, padj = 2)
  
  # Fermer le fichier PNG
  dev.off()
  
}