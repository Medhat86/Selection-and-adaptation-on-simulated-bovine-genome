setwd("~/Ghat_sim")
rm(list=ls())

iter <- "001"

directory="/home/uni08/mahmoud1/Ghat_sim/r_m64k"
  
#Calculating LD for the Selected Populations (Line 1)
  

data    <-read.table(paste(directory, "/Line_1_data_",iter,".txt",sep=""),
                    header=T,fill=T,stringsAsFactors=F)

g20 <- subset(data, data$G == 20, select = Progeny)

geno <- read.table(paste(directory, "/Line_1_mrk_",iter,".txt",sep=""),
                   header=F,stringsAsFactors=F,skip=1,sep="", 
                   colClasses=c("numeric","character")) 

geno <- geno[geno$V1 %in% g20$Progeny,]

map     <- read.table(paste(directory, "/lm_mrk_",iter,".txt",sep=""),
                      header=T,stringsAsFactors=F)


### Manipulate genotypes
  
gen <- matrix(NA,nrow=nrow(map),ncol=nrow(geno))
gen <- as.data.frame(gen)
names(gen) <- geno[,1]
for(i in 1:nrow(geno)){
  #print(i)
  tmp <- as.numeric(unlist(strsplit(geno[i,2],split="")))
  tmp[which(tmp == 0)] <- -1
  tmp[which(tmp == 3 | tmp ==4)] <- 0
  tmp[which(tmp==2)] <- 1
  gen[,i] <- tmp
  }
  
gen<-t(gen)
g <- cbind(row.names(gen),data.frame(gen +1))
  
library("parallel")
source("ld.R")
  
ld <- ld_decay2 (gen=g, map=map, max_win_snp=2000,
                          max.chr=30, cores=20, max_r2=0.03)

save(ld, file = "ld_m64k_s.RData")

###################################
###################################

rm(list=ls())

iter <- "001"

directory="/home/uni08/mahmoud1/Ghat_sim/r_m64k"

#Calculating LD for the Controlled Populations (Line 2)


data    <-read.table(paste(directory, "/Line_2_data_",iter,".txt",sep=""),
                    header=T,fill=T,stringsAsFactors=F)

g20 <- subset(data, data$G == 20, select = Progeny)

geno <- read.table(paste(directory, "/Line_2_mrk_",iter,".txt",sep=""),
                   header=F,stringsAsFactors=F,skip=1,sep="", 
                   colClasses=c("numeric","character")) 

geno <- geno[geno$V1 %in% g20$Progeny,]

map     <- read.table(paste(directory, "/lm_mrk_",iter,".txt",sep=""),
                      header=T,stringsAsFactors=F)


### Manipulate genotypes

gen <- matrix(NA,nrow=nrow(map),ncol=nrow(geno))
gen <- as.data.frame(gen)
names(gen) <- geno[,1]
for(i in 1:nrow(geno)){
  #print(i)
  tmp <- as.numeric(unlist(strsplit(geno[i,2],split="")))
  tmp[which(tmp == 0)] <- -1
  tmp[which(tmp == 3 | tmp ==4)] <- 0
  tmp[which(tmp==2)] <- 1
  gen[,i] <- tmp
}

gen<-t(gen)
g <- cbind(row.names(gen),data.frame(gen +1))

library("parallel")
source("ld.R")

ld <- ld_decay2 (gen=g, map=map, max_win_snp=2000,
                          max.chr=30, cores=20, max_r2=0.03)

save(ld, file = "ld_m64k_c.RData")


