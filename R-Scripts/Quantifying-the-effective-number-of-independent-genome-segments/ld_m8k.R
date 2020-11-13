
rm(list=ls())
setwd("/home/uni08/mahmoud1/Ghat_sim")

source("Meff_PCA.R")
source("inferCutoff.R")
PCA_cutoff <- 0.995


iter <- "001"

directory="/home/uni08/mahmoud1/Ghat_sim/r_m8k"

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

g$`row.names(gen)`<- NULL


maf <- ifelse(colMeans(g)/2>0.5,1-colMeans(g)/2,colMeans(g)/2)

geno_filtered <- g[, which(maf > 0.05 )]

mySNP_nonmissing <- t(geno_filtered)

#mySNP_nonmissing <- mySNP_nonmissing[1:50,]

numLoci <- length(mySNP_nonmissing[, 1])

simpleMeff <- NULL
fixLength <- 2000 
i <- 1
myStart <- 1
myStop <- 1
while(myStop < numLoci){
  myDiff <- numLoci - myStop 
  if(myDiff <= fixLength) break
  
  myStop <- myStart + i*fixLength - 1
  snpInBlk <- t(mySNP_nonmissing[myStart:myStop, ])
  MeffBlk <- inferCutoff(snpInBlk)
  simpleMeff <- c(simpleMeff, MeffBlk)
  myStart <- myStop+1
}
snpInBlk <- t(mySNP_nonmissing[myStart:numLoci, ])
MeffBlk <- inferCutoff(snpInBlk)
simpleMeff <- c(simpleMeff, MeffBlk)


ld_m8k_s<- sum(simpleMeff)

save(ld_m8k_s, file = "ld_m8k_S.RData")

###################################
###################################


rm(list=ls())
setwd("/home/uni08/mahmoud1/Ghat_sim")

source("Meff_PCA.R")
source("inferCutoff.R")
PCA_cutoff <- 0.995


iter <- "001"

directory="/home/uni08/mahmoud1/Ghat_sim/r_m8k"

#Calculating LD for the controlled Populations (Line 2)


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

g$`row.names(gen)`<- NULL


maf <- ifelse(colMeans(g)/2>0.5,1-colMeans(g)/2,colMeans(g)/2)

geno_filtered <- g[, which(maf > 0.05 )]

mySNP_nonmissing <- t(geno_filtered)

#mySNP_nonmissing <- mySNP_nonmissing[1:50,]

numLoci <- length(mySNP_nonmissing[, 1])

simpleMeff <- NULL
fixLength <- 2000 
i <- 1
myStart <- 1
myStop <- 1
while(myStop < numLoci){
  myDiff <- numLoci - myStop 
  if(myDiff <= fixLength) break
  
  myStop <- myStart + i*fixLength - 1
  snpInBlk <- t(mySNP_nonmissing[myStart:myStop, ])
  MeffBlk <- inferCutoff(snpInBlk)
  simpleMeff <- c(simpleMeff, MeffBlk)
  myStart <- myStop+1
}
snpInBlk <- t(mySNP_nonmissing[myStart:numLoci, ])
MeffBlk <- inferCutoff(snpInBlk)
simpleMeff <- c(simpleMeff, MeffBlk)

ld_m8k_c<- sum(simpleMeff)

save(ld_m8k_c, file = "ld_m8k_c.RData")