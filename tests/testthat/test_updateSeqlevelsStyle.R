context("Test updateSeqlevelsStyle function")
if (!requireNamespace('BiocManager', quietly = TRUE)) {
    install.packages('BiocManager')
   }

test_that("hg38, UCSC to NCBI", {
  #if (!requireNamespace('BiocManager', quietly = TRUE)) {
  #  install.packages('BiocManager')
  #  BiocManager::install("remotes")
  #}
  
  BiocManager::install("BSgenome.Hsapiens.UCSC.hg38", ask=FALSE, update=FALSE)

  genome <- getBSgenome("hg38")
  bsgenome <- genome
  
  seqlevelsStyle(bsgenome) <- "NCBI"
  genome <- updateSeqlevelsStyle(genome, metadata(genome)$genome, "NCBI", metadata(genome)$provider, "./")
  
  expect_equal(seqnames(genome), seqnames(bsgenome))
  
})

test_that("hg38, NCBI to UCSC", {
  #if (!requireNamespace('BiocManager', quietly = TRUE)) {
  #  install.packages('BiocManager')
  #}
  
  #BiocManager::install("BSgenome.Hsapiens.NCBI.GRCh38", ask=FALSE, update=FALSE)
  
  genome <- getBSgenome("GRCh38")
  bsgenome <- genome
  
  seqlevelsStyle(bsgenome) <- "UCSC"
  genome <- updateSeqlevelsStyle(genome, metadata(genome)$genome, "UCSC", metadata(genome)$provider, "./")
  
  expect_equal(seqnames(genome), seqnames(bsgenome))
  
})

test_that("hg19, NCBI to UCSC", {
  #if (!requireNamespace('BiocManager', quietly = TRUE)) {
  #  install.packages('BiocManager')
  #}
  
  #BiocManager::install("BSgenome.Hsapiens.1000genomes.hs37d5", ask=FALSE, update=FALSE)
  genome <- getBSgenome("hs37d5")
  bsgenome <- genome
  
  seqlevelsStyle(bsgenome) <- "UCSC"
  genome <- updateSeqlevelsStyle(genome, metadata(genome)$genome, "UCSC", metadata(genome)$provider, "./")
  
  expect_equal(seqnames(genome), seqnames(bsgenome))
  
})

test_that("hg19, UCSC to NCBI", {
  #if (!requireNamespace('BiocManager', quietly = TRUE)) {
  #  install.packages('BiocManager')
  #}
  #BiocManager::install("BSgenome.Hsapiens.UCSC.hg19", ask=FALSE, update=FALSE)
  genome <- getBSgenome("hg19")
  bsgenome <- genome
  
  seqlevelsStyle(bsgenome) <- "NCBI"
  genome <- updateSeqlevelsStyle(genome, metadata(genome)$genome, "NCBI", metadata(genome)$provider, "./")
  
  expect_equal(seqnames(genome), seqnames(bsgenome))
  
})
