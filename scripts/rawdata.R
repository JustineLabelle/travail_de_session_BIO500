rawdata <- function(file_paths) {
  
  
  allFiles <- dir('data/raw/')
  
  # Tables à fusioner
  tabNames <- c('collaboration', 'cour', 'etudiant')
  
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
  master_list <<-list(collaborationdata1,collaborationdata10,collaborationdata2,collaborationdata3,collaborationdata4,collaborationdata5,collaborationdata6,collaborationdata7,collaborationdata8,collaborationdata9,courdata1,courdata10,courdata2,courdata3,courdata4,courdata5,courdata6,courdata7,courdata8,courdata9,etudiantdata1,etudiantdata10,etudiantdata2,etudiantdata3,etudiantdata4,etudiantdata5,etudiantdata6,etudiantdata7,etudiantdata8,etudiantdata9)
  
  master_list <<-setNames(master_list, c("collaborationdata1","collaborationdata10","collaborationdata2","collaborationdata3","collaborationdata4","collaborationdata5","collaborationdata6","collaborationdata7","collaborationdata8","collaborationdata9","courdata1","courdata10","courdata2","courdata3","courdata4","courdata5","courdata6","courdata7","courdata8","courdata9","etudiantdata1","etudiantdata10","etudiantdata2","etudiantdata3","etudiantdata4","etudiantdata5","etudiantdata6","etudiantdata7","etudiantdata8","etudiantdata9"))
  
  # nettoyer des objets temporaires utilisé dans la boucle
  rm(list = c('allFiles', 'tab', 'tabFiles', 'tabName', 'ficher', 'groupe',"L","nbGroupe","separateur","tabNames"))
  rm(list=c("collaborationdata1","collaborationdata10","collaborationdata2","collaborationdata3","collaborationdata4","collaborationdata5","collaborationdata6","collaborationdata7","collaborationdata8","collaborationdata9","etudiantdata1","etudiantdata10","etudiantdata2","etudiantdata3","etudiantdata4","etudiantdata5","etudiantdata6","etudiantdata7","etudiantdata8","etudiantdata9","courdata1","courdata10","courdata2","courdata3","courdata4","courdata5","courdata6","courdata7","courdata8","courdata9"))
  return(master_list)
  
}

