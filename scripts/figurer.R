figurer<- function(requete){
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
  
  #install.packages scales
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
  
  png("figures/figure1.png")
  # Print le réseau selon les conditions définies
  #1.5, 1.5, 1.5, 1.5
  #par(mfrow=c(1,1), mar=c(1.5, 1.5, 1.5, 1.5))
  plot.new()
  reseau<-plot(g, edge.arrow.mode = 0,
               vertex.label = NA, layout = layout.kamada.kawai(g),
               vertex.shape = "circle", vertex.frame.color = "black",
               edge.width = E(g)$width,
               edge.color = edge_colors,
               vertex.color = node_colors,
               vertex.size = node_sizes)
  # Fermer le fichier PNG
  dev.off()
  
  #mettre une légende pour les couleurs selon les classes
  legend(x = "right", y = "top", legend = c("Classe 1 : Faible centralité", "Classe 2", "Classe 3", "Classe 4", "Classe 5 : Forte centralité"), col = colors_res, pch = 16, cex = sizes, bty = "n",x.intersp = 0.5, y.intersp = 0.5)
  #mettre un titre au réseau
  mtext("Figure 1 : Réseau de collaborations des étudiants du cours BIO500 à l'hiver 2023.", side = 1, line = 4, col = "black", font = 2, cex = 0.6, adj = 0, padj = -10)
  
  
  #-------------------------------
  #Création du graphique violon de la centralité selon la session de dénut de programme (figure 2)
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
  
  png("figures/figure2.png")
  # faire le violin plot
  par(mfrow=c(1,1), mar=c(8, 4, 4, 3))
  plot.new()
  vioplot(centralite ~ annee_debut, data = infotab, col = "#CCE5FF", border= "#99CCFF", xlab= "Session de début", ylab = "Coefficient de centralité", yaxs="i", cex.lab = 1, cex.axis = 0.7)
  #mettre les points dans la figure
  points(infotab$annee_debut, infotab$centralite, col = "#3366FF")
  #mettre un titre à la figure
  mtext("Figure 2 : Distribution de la centralité selon la session de début de programme.", side = 1, line = 4, col = "black", font = 2, cex = 0.7, adj = 0, padj = 2)
  # Fermer le fichier PNG
  dev.off()
  
  ##création du barplot de la moyenne de la centrallité selon la formation préalable (figure 3)
  
  # Faire en sorte que le bareplot prennes aussi les NA dans la figure
  infotab$formation_prealable <- factor(infotab$formation_prealable)
  levels(infotab$formation_prealable) <- c(levels(infotab$formation_prealable), "NA")
  infotab$formation_prealable[is.na(infotab$formation_prealable)] <- "NA"
  
  # Calculer la moyenne de centralité et l'écart type pour chaque catégorie de formation_prealable
  means <- aggregate(infotab$centralite, by = list(infotab$formation_prealable), FUN = mean)
  sd <- aggregate(infotab$centralite, by = list(infotab$formation_prealable), FUN = sd)
  
  
  # Definir les couleurs selon les formations préalable
  colors_bar <- colorRampPalette(c("#009966", "#0072B2", "#D55E00", "#CC79A7"))
  
  # Définir le nom et le chemin d'accès du fichier PNG
  png("figures/figure3.png")
  
  # Créer le diagramme en barres avec les moyennes de centralité
  par(mfrow=c(1,1), mar=c(8, 4, 4, 3))
  plot.new()
  barplot(height = means$x, names.arg = means$Group.1, col = colors_bar(length(means$x)), xlab = "Formation préalable", ylab = "Moyenne de centralité", ylim= c(0,1))
  #mettre les bandes d'écart type
  arrows(x0=barplot(height = means$x, plot=FALSE), y0=means$x-sd$x, x1=barplot(height = means$x, plot=FALSE), y1=means$x+sd$x, angle=90, code=3, length=0.1)
  #mettre un titre à la figure
  mtext("Figure 3 : Moyenne de centralité par formation préalable.", side = 1, line = 4, col = "black", font = 2, cex = 1, adj = 0, padj = 2)
  
  # Fermer le fichier PNG
  dev.off()
}
