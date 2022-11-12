
# <img src="https://github.com/Medhat86/Ghat/blob/master/GOE_Logo_Quer_IPC_Farbe_RGB.png" />


# Selection and Adaptation on Simulated Bovine Genome

This repository houses code and data (simulated bovine genome) to identify selection on quantitative traits. In this repository, we have divided files into sub directories as outlined below. For analyses performed using GWDG Scientific Compute Cluster, we have deposited both bash files and outputs.

We generated a simulated cattle data set with divergent selection to further test and demonstrate the efficacy of Ghat. This allowed us to evaluate how the Ghat package per-forms in terms of different genetic architectures and experimental parameters, which are never perfectly known using real data. In this analysis, we assessed the impact of trait heritability (h2), sample size (n), trait polygenicity (number of QTL (nQTL)), and marker density (MD) on the performance of Ghat. 


## Data Simulation

We simulated 30 bovine chromosomes of a length of 100 cM using QMsim [33] . Our simulations started with 100 historical generations of drift-only, and then we sampled two distinct populations to undergo selection (two isolated population). Population-A (unselected population) is a population that underwent complete random mating (i.e. no selection) for 20 generations; Population-B (selected population) is a population that underwent strong pheno-typic selection for 20 generations (Fig 5). Aside from selection, Population-A and Population-B were identical and were treated identically during the simulated experiment. After simulat-ing the populations, we applied Ghat to test for selection during the most recent 5 generations (generation #20 – generations #15) in both populations (unselected population and selected populations), creating a realistic situation in dairy cattle breeding. We estimated the allele ef-fects using the genotypes of all 20 generations for more accurate estimation.

# <img src="https://github.com/Medhat86/Ghat/blob/master/Bovine.png" />


Please visit [https://github.com/Medhat86/Ghat](https://cran.r-project.org/web/packages/Ghat/Ghat.pdf) for documentation and examples.

## Citation

- In case you want / have to cite my package, please use `citation('Ghat')` (https://cran.r-project.org/web/packages/Ghat/index.html) for citation information. 

- Since core functionality of package depends on the [Ghat-Method](https://cran.r-project.org/package=ggplot2), consider citing this refernce as well: "Tim Beissinger, Jochen Kruppa, David Cavero, Ngoc-Thuy Ha, Malena Erbe, Henner Simianer, A Simple Test Identifies Selection on Complex Traits, Genetics, Volume 209, Issue 1, 1 May 2018, Pages 321–333, https://doi.org/10.1534/genetics.118.300857"

