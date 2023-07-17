minigr = read.delim("hprc-v1.0-minigraph-grch38.bb.bed", h=FALSE, sep="\t")
library(Biostrings)
longest_path = DNAStringSet(minigr$V14)
shortest_path = DNAStringSet(gsub("\\*", "N", minigr$V13))
library(S4Vectors)
library(GenomicRanges)
gr = GRanges(minigr$V1, IRanges(minigr$V2, minigr$V3))
mco =DataFrame(minigr[,c("V4", "V5", "V6", "V7", "V8", "V9", "V10", "V11", "V12")], shortest_path, longest_path)
mcols(gr) = mco
genome(gr) = "GRCh38"
metadata(gr) = list(description=mgbed_desc, hprc_version="1.0", sourcebed = "hrpc-v1.0-minigraph-grch38.bb.bed")
minigr_GRCh38 = gr
save(minigr_GRCh28, file="minigr_GRCh38.rda")
