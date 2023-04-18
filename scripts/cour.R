cour <- function(rawdatatarget) {
  
  

  #Utiliser subset pour selectionner seulememnt les colonnes interessante
  
  rawdatatarget$courdata5 <- subset(rawdatatarget$courdata5,select = c("sigle","optionnel","credits"))
  rawdatatarget$courdata7 <- subset(rawdatatarget$courdata7,select = c("sigle","optionnel","credits"))
  
  
  ##changer le seul nom de colonne différent des autres pour cours
  names(rawdatatarget$courdata4)[names(rawdatatarget$courdata4) == "ï..sigle"] <- "sigle"
  
  
  #on unie les tableaux
  courdata<- rbind(rawdatatarget$courdata1,rawdatatarget$courdata2,rawdatatarget$courdata3,rawdatatarget$courdata4,rawdatatarget$courdata5,rawdatatarget$courdata6,rawdatatarget$courdata7,rawdatatarget$courdata8,rawdatatarget$courdata9,rawdatatarget$courdata10)
  
  
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
  write.csv(cour_clean, pathcour,row.names = F)
  rm(list = ls())
  
  pathcour<- file.path("data","clean","clean_cour.csv")
  cour<-read.csv(file= pathcour,sep = ",")
  rm(pathcour)
  
  
  library(RSQLite)
  con <- dbConnect(SQLite(), dbname="reseau.db")
  dbWriteTable(con, append = TRUE, name = "cours", value = cours, row.names = FALSE)
  rm(con)
  
  return(cour)
}



