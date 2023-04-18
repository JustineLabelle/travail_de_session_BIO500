collaboration <- function(rawdatatarget) {
  
  #Utiliser subset pour selectionner seulememnt les colonnes interessante
  
  rawdatatarget$collaborationdata7 <- subset(rawdatatarget$collaborationdata7,select = c("etudiant1","etudiant2","sigle","session"))
  
  #on unie les tableaux
  collaborationdata<- rbind(rawdatatarget$collaborationdata1,rawdatatarget$collaborationdata2,rawdatatarget$collaborationdata3,rawdatatarget$collaborationdata4,rawdatatarget$collaborationdata5,rawdatatarget$collaborationdata6,rawdatatarget$collaborationdata7,rawdatatarget$collaborationdata8,rawdatatarget$collaborationdata9,rawdatatarget$collaborationdata10)
  
  #pour enlever les lignes doublons
  
  collaborationdata_unique<-unique(collaborationdata)
  collaborationdata_unique1<-subset(collaborationdata_unique,complete.cases(collaborationdata_unique$etudiant1))
  
  #Correction fautes de francais collaboration
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
  
  
  class(collaborationdata_unique1)
  
  library(stringr)
  
  # Écriture de la table filtrée dans un nouveau fichier
  pathcoll<- file.path("data","clean","clean_collaboration.csv")
  write.csv(collaborationdata_unique1, pathcoll, row.names = F)
  rm(list = ls())
  
  pathcoll<- file.path("data","clean","clean_collaboration.csv")
  collaborations<-read.csv(file= pathcoll,sep = ",")
  rm(pathcoll)
  
  library(RSQLite)
  con <- dbConnect(SQLite(), dbname="reseau.db")
  dbWriteTable(con, append = TRUE, name = "collaborations", value = collaborations, row.names = FALSE)
  rm(con)
  
  
  return(collaborations)
  }



