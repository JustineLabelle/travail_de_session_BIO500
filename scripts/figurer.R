#Créer une fonction dans laquelle se trouve toutes les informations nécessaires à la création de nos figures

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

  #Créer un objet igraph
  g<-graph.adjacency(matrice)

  # Calculer la centralité de degré
  ec <- eigen_centrality(g)$vector
  
  #Mettre les données de centralités dans un data frame
  donnecentralite <- data.frame(nom = names(ec), centralite = ec)
  
  #combiner le tableau de centralité et le tableau resultat contenant les informations des étudiants 
  infotab <- merge(resultat, donnecentralite, by.x = "prenom_nom", by.y = "nom")
  
  listfigure<-list(infotab, ec, g)
  return(listfigure)
}

#figurer(requete)
        