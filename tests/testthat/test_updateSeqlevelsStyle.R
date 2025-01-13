context("Test updateSeqlevelsStyle function")

test_that("hg38, UCSC to NCBI", {
  if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
  library(BiocManager)

  BiocManager::install("BSgenome.Hsapiens.UCSC.hg38")
  genome <- getBSgenome("hg38")
  bsgenome <- genome
  
  seqlevelsStyle(bsgenome) <- "NCBI"
  genome <- updateSeqlevelsStyle(genome, metadata(genome)$genome, "NCBI", metadata(genome)$provider, "./")
  
  expect_equal(seqnames(genome), seqnames(bsgenome))
  
})

test_that("hg38, NCBI to UCSC", {
  BiocManager::install("BSgenome.Hsapiens.NCBI.GRCh38")
  genome <- getBSgenome("GRCh38")
  bsgenome <- genome
  
  seqlevelsStyle(bsgenome) <- "UCSC"
  BiocManager::genome <- updateSeqlevelsStyle(genome, metadata(genome)$genome, "UCSC", metadata(genome)$provider, "./")
  
  expect_equal(seqnames(genome), seqnames(bsgenome))
  
})

test_that("hg19, NCBI to UCSC", {
  BiocManager::install("BSgenome.Hsapiens.1000genomes.hs37d5")
  genome <- getBSgenome("hs37d5")
  bsgenome <- genome
  
  seqlevelsStyle(bsgenome) <- "UCSC"
  genome <- updateSeqlevelsStyle(genome, metadata(genome)$genome, "UCSC", metadata(genome)$provider, "./")
  
  expect_equal(seqnames(genome), seqnames(bsgenome))
  
})

test_that("hg19, UCSC to NCBI", {
  BiocManager::install("BSgenome.Hsapiens.UCSC.hg19")
  genome <- getBSgenome("hg19")
  bsgenome <- genome
  
  seqlevelsStyle(bsgenome) <- "NCBI"
  genome <- updateSeqlevelsStyle(genome, metadata(genome)$genome, "NCBI", metadata(genome)$provider, "./")
  
  expect_equal(seqnames(genome), seqnames(bsgenome))
  
})
