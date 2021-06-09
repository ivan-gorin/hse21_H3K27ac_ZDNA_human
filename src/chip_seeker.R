cwd = 'C:\\Users\\Ivan\\Documents\\hse21_H3K4me1_G4_human\\src'
setwd(cwd)

source('lib.R')

###

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("ChIPseeker")
BiocManager::install("TxDb.Hsapiens.UCSC.hg19.knownGene")
BiocManager::install('clusterProfiler')
BiocManager::install("org.Hs.eg.db")

library(ChIPseeker)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
library(clusterProfiler)

###

NAME <- 'H3K4me1_A549.intersect_with_G4'
#NAME <- 'G4'

#NAME <- 'H3K4me1_A549.ENCFF379KHF.hg19.filtered'
#NAME <- 'H3K4me1_A549.ENCFF675YHQ.hg19.filtered'
BED_FN <- paste0(DATA_DIR, NAME, '.bed')

###

txdb <- TxDb.Hsapiens.UCSC.hg19.knownGene

peakAnno <- annotatePeak(BED_FN, tssRegion=c(-3000, 3000), TxDb=txdb, annoDb="org.Hs.eg.db")

#pdf(paste0(OUT_DIR, 'chip_seeker.', NAME, '.plotAnnoPie.pdf'))
png(paste0(OUT_DIR, 'chip_seeker.', NAME, '.plotAnnoPie.png'))
plotAnnoPie(peakAnno)
dev.off()

# peak <- readPeakFile(BED_FN)
# pdf(paste0(OUT_DIR, 'chip_seeker.', NAME, '.covplot.pdf'))
# covplot(peak, weightCol="V5")
# dev.off()
# 
