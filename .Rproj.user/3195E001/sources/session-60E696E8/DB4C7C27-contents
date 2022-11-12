
# <img src="https://github.com/Medhat86/Ghat/blob/master/GOE_Logo_Quer_IPC_Farbe_RGB.png" />


# Selection and Adaptation on Simulated Bovine Genome

This repository houses code and data (simulated bovine genome) to identify selection on quantitative traits. In this repository, we have divided files into sub directories as outlined below. For analyses performed using GWDG Scientific Compute Cluster, we have deposited both bash files and outputs.

We generated a simulated cattle data set with divergent selection to further test and demonstrate the efficacy of Ghat. This allowed us to evaluate how the Ghat package per-forms in terms of different genetic architectures and experimental parameters, which are never perfectly known using real data. In this analysis, we assessed the impact of trait heritability (h2), sample size (n), trait polygenicity (number of QTL (nQTL)), and marker density (MD) on the performance of Ghat. 


## Examples


### Example-1 Both SNP effects and change in allele frequency are known


```r
maize		<- Maize_wqs[[1]]
result.adf	<- Ghat(effects =maize[,1], change=maize[,2], method="scale",
                     perms=1000, plot="Ghat", num_eff=54.74819)
mtext(paste("WQS ADF test for selection, pval = ", round(result.adf$p.val,4)))
message (c(result.adf$Ghat , result.adf$Cor , result.adf$p.va))
```

### Example-2 Both SNP effects and change in allele frequency are known
#### Step 1: Run rrBLUP and estimating allels effects

```r
library(Ghat)
library(parallel)
library(rrBLUP)
phe                 <- Maize_wqs[[2]]
map                 <- Maize_wqs[[3]]
gen                 <- Maize_wqs[[4]]
phe                 <-phe[which(is.na(phe[,2])==FALSE),]
gen                 <-gen[which(is.na(phe[,2])==FALSE),]
result              <- mixed.solve(phe[,2],
                                   Z= as.matrix(gen[,2:ncol(gen)]),
                                   X= model.matrix(phe[,2]~phe[,3]),
                                   K=NULL, SE=FALSE, return.Hinv=FALSE,
                                   method="ML")
``` 
                       
#### Step 2: Is to calculate the allele frequency at Cycle 1 and 3 

```r  
CycleIndicator      <- as.numeric(unlist(strsplit(gen$X,
                       split="_C")) [seq(2,2*nrow(gen),2)])
Cycle1              <- gen[which(CycleIndicator == 1),]
Cycle3              <- gen[which(CycleIndicator == 3),]
CycleList           <- list(Cycle1,Cycle3)
frequencies         <- matrix(nrow=ncol(gen)-1,ncol=2)
for(i in 1:2){
  frequencies[,i]   <- colMeans(CycleList[[i]][,-1],na.rm=TRUE)/2
}
frequencies         <- as.data.frame(frequencies)
names(frequencies)  <- c("Cycle1","Cycle3")
change<-frequencies$Cycle3-frequencies$Cycle1
```

#### Step 3: Calculate LD Decay 

```r
ld                  <- ld_decay (gen=gen, map=map,
                                 max_win_snp=2000, max.chr=10,
                                 cores=1, max_r2=0.03)
```

#### Step 4: Calculate Ghat

```r
Ghat.adf    <- Ghat(effects=result$u, change=change, method = "scale",
                    perms=1000,plot="Ghat", num_eff = 54.74819)

message (paste("Ghat=" , Ghat.adf$Ghat,
            "Cor="  , Ghat.adf$Cor ,
            "P-val=", Ghat.adf$p.va, sep = " "))
```

Please visit [https://github.com/Medhat86/Ghat](https://cran.r-project.org/web/packages/Ghat/Ghat.pdf) for documentation and examples.

## Citation

- In case you want / have to cite my package, please use `citation('Ghat')` (https://cran.r-project.org/web/packages/Ghat/index.html) for citation information. 

- Since core functionality of package depends on the [Ghat-Method](https://cran.r-project.org/package=ggplot2), consider citing this refernce as well: "Tim Beissinger, Jochen Kruppa, David Cavero, Ngoc-Thuy Ha, Malena Erbe, Henner Simianer, A Simple Test Identifies Selection on Complex Traits, Genetics, Volume 209, Issue 1, 1 May 2018, Pages 321–333, https://doi.org/10.1534/genetics.118.300857"

