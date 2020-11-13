setwd("~/Ghat_sim")
rm(list=ls())

library(BGLR)
source("Ghat2.R")

Pvals.res <- c()
Ghat.res <- c()
Cor.res <- c()

for(sim in 1:100){
  iter <- sprintf("%03i",sim)
  directory="/home/uni08/mahmoud1/Ghat_sim/r_m1k"
  
  #load genotypes and phenotypes
  
  pheno   <- read.table(paste(directory, "/Line_1_data_",iter,".txt",sep=""),
                        header=T,stringsAsFactors=F)
  map     <- read.table(paste(directory, "/lm_mrk_",iter,".txt",sep=""),
                        header=T,stringsAsFactors=F)
  geno <- read.table(paste(directory, "/Line_1_mrk_",iter,".txt",sep=""),
                     header=F,stringsAsFactors=F,skip=1,sep="", 
                     colClasses=c("numeric","character")) # read genos as characters

  
  #load allele frequencies
  freqs<-read.table(paste(directory, "/Line_1_freq_mrk_",iter,".txt",sep=""),
                    header=T,fill=T,stringsAsFactors=F)
  freqs_15    <-  freqs[freqs$Gen == 15,] 
  freqs_20    <-  freqs[freqs$Gen == 20,]
  
  ### Manipulate genotypes by coding to -1,0,1 and so that markers are columns,
  #individuals are rows.
  
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
  gc()
  
  
  ##### Estimate allel efeects 
  
  g <- cbind(row.names(gen),data.frame(gen +1))
  g$`row.names(gen)`<- NULL
  
  nIter=600; burnIn=100
  
  fmBC=BGLR(pheno$Phen,ETA=list( list(X=g,model='BayesC')), 
            nIter=nIter,burnIn=burnIn,saveAt='bc_')
  
  se <- data.frame(fmBC$ETA[[1]]$b)
  
  ### Calculate allele frequencies
  # Generation 15
  names(freqs_15)[4] <- "Allele1"
  names(freqs_15)[5]<- "Allele2"
  freqs_15$Allele2[which(substr(freqs_15$Allele1,1,1)==2)] <- "2:1.00000" 
  # put this in the spot for the second allele
  freqs_15$Allele1[which(substr(freqs_15$Allele1,1,1)==2)] <- "1:0.00000" 
  freqs_15$Allele2[which(substr(freqs_15$Allele1,3,3)==1)] <- "2:0.00000" ##
  freqs_15$Allele1 <- as.numeric(substr(freqs_15$Allele1,3,nrow(map)))
  freqs_15$Allele2 <- as.numeric(substr(freqs_15$Allele2,3,nrow(map)))
  # Generation 20
  names(freqs_20)[4]<- "Allele1"
  names(freqs_20)[5]<- "Allele2"
  freqs_20$Allele2[which(substr(freqs_20$Allele1,1,1)==2)] <- "2:1.00000" 
  # put this in the spot for the second allele
  freqs_20$Allele1[which(substr(freqs_20$Allele1,1,1)==2)] <- "1:0.00000" 
  freqs_20$Allele2[which(substr(freqs_20$Allele1,3,3)==1)] <- "2:0.00000"  ##
  freqs_20$Allele1 <- as.numeric(substr(freqs_20$Allele1,3,nrow(map)))
  freqs_20$Allele2 <- as.numeric(substr(freqs_20$Allele2,3,nrow(map)))
  #Calculate change
  change2<-freqs_20$Allele2-freqs_15$Allele2
  
  ##### load SNP effects
  
  
  test<-  Ghat2(effects=se$fmBC.ETA..1...b, change=change2, 
               method = "scale", perms = 1000,
               num_eff = 4117)
  
  Ghat.res[as.numeric(iter)]  <- test$Ghat
  Pvals.res[as.numeric(iter)] <- test$p.val
  Cor.res[as.numeric(iter)]   <- test$Cor
}

### Report the results

m1k_s <- cbind(Ghat.res, Pvals.res, Cor.res)
save(m1k_s, file = "m1k_s.RData")

## ############################
## ############################
## ############################

### Estimating Ghat for the Controlled Populations.


setwd("~/Ghat_sim")
rm(list=ls())

library(BGLR)
source("Ghat2.R")

Pvals.res <- c()
Ghat.res <- c()
Cor.res <- c()

for(sim in 1:100){
  iter <- sprintf("%03i",sim)
  directory="/home/uni08/mahmoud1/Ghat_sim/r_m1k"
  
  #load genotypes and phenotypes
  
  pheno   <- read.table(paste(directory, "/Line_2_data_",iter,".txt",sep=""),
                        header=T,stringsAsFactors=F)
  map     <- read.table(paste(directory, "/lm_mrk_",iter,".txt",sep=""),
                        header=T,stringsAsFactors=F)
  geno <- read.table(paste(directory, "/Line_2_mrk_",iter,".txt",sep=""),
                     header=F,stringsAsFactors=F,skip=1,sep="", 
                     colClasses=c("numeric","character")) # read genos as characters
  
  
  #load allele frequencies
  freqs<-read.table(paste(directory, "/Line_2_freq_mrk_",iter,".txt",sep=""),
                    header=T,fill=T,stringsAsFactors=F)
  freqs_15    <-  freqs[freqs$Gen == 15,] 
  freqs_20    <-  freqs[freqs$Gen == 20,]
  
  ### Manipulate genotypes by coding to -1,0,1 and so that markers are columns,
  #individuals are rows.
  
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
  gc()
  
  
  ##### Estimate allel efeects 
  
  g <- cbind(row.names(gen),data.frame(gen +1))
  g$`row.names(gen)`<- NULL
  
  nIter=600; burnIn=100
  
  fmBC=BGLR(pheno$Phen,ETA=list( list(X=g,model='BayesC')), 
            nIter=nIter,burnIn=burnIn,saveAt='bc_')
  
  se <- data.frame(fmBC$ETA[[1]]$b)
  
  ### Calculate allele frequencies
  # Generation 15
  names(freqs_15)[4] <- "Allele1"
  names(freqs_15)[5]<- "Allele2"
  freqs_15$Allele2[which(substr(freqs_15$Allele1,1,1)==2)] <- "2:1.00000" 
  # put this in the spot for the second allele
  freqs_15$Allele1[which(substr(freqs_15$Allele1,1,1)==2)] <- "1:0.00000" 
  freqs_15$Allele2[which(substr(freqs_15$Allele1,3,3)==1)] <- "2:0.00000" ##
  freqs_15$Allele1 <- as.numeric(substr(freqs_15$Allele1,3,nrow(map)))
  freqs_15$Allele2 <- as.numeric(substr(freqs_15$Allele2,3,nrow(map)))
  # Generation 20
  names(freqs_20)[4]<- "Allele1"
  names(freqs_20)[5]<- "Allele2"
  freqs_20$Allele2[which(substr(freqs_20$Allele1,1,1)==2)] <- "2:1.00000" 
  # put this in the spot for the second allele
  freqs_20$Allele1[which(substr(freqs_20$Allele1,1,1)==2)] <- "1:0.00000" 
  freqs_20$Allele2[which(substr(freqs_20$Allele1,3,3)==1)] <- "2:0.00000"  ##
  freqs_20$Allele1 <- as.numeric(substr(freqs_20$Allele1,3,nrow(map)))
  freqs_20$Allele2 <- as.numeric(substr(freqs_20$Allele2,3,nrow(map)))
  #Calculate change
  change2<-freqs_20$Allele2-freqs_15$Allele2
  
  ##### load SNP effects
  
  
  test<-  Ghat2(effects=se$fmBC.ETA..1...b, change=change2, 
                method = "scale", perms=1000,
                num_eff = 4262)
  
  Ghat.res[as.numeric(iter)]  <- test$Ghat
  Pvals.res[as.numeric(iter)] <- test$p.val
  Cor.res[as.numeric(iter)]   <- test$Cor
}

### Report the results

m1k_c <- cbind(Ghat.res, Pvals.res, Cor.res)
save(m1k_c, file = "m1k_c.RData")