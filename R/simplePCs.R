
#' produce colored display of PCA of simple (putatively biallelic) genotypes from HPRC
#' @importFrom dplyr left_join mutate
#' @import ggplot2
#' @import snpStats
#' @param clvcf CollapsedVCF instance from VariantAnnotation
#' @param particdf data.frame or tibble denoting populations etc. of HPRC participants
#' @param pop character(1) "super" or "sub" to denote population type used to color points
#' @examples
#' data("smyd3v", package="BiocHPRClk")
#' data(hprc_partic)
#' simplePCs(smyd3v, hprc_partic)
#' @export
simplePCs = function(clvcf, particdf, pop="super") {
  gt = geno(clvcf)$GT
  rr = rowRanges(clvcf)
  ss = genotypeToSnpMatrix(gt, ref=rr$REF, alt=rr$ALT)
  ssm2 = as(ss$geno, "numeric")
  lkc = apply(ssm2[-1,],2,function(x)all(!is.na(x)))
  nd = ssm2[,which(lkc)]
  pca = prcomp(nd[-1,])  # row 1 is logical not CHM
  data(hprc_partic)
  library(dplyr)
  pcdf = data.frame(pca$x)
  pcdf$id = rownames(pcdf)
  part = hprc_partic
  xdf = left_join(pcdf, mutate(part, id=participant_id), by="id")
  pl = ggplot(xdf, aes(x=PC1, y=PC2, colour=Superpopulation)) 
  if (pop == "sub") pl = ggplot(xdf, aes(x=PC1, y=PC2, colour=Subpopulation))
  pl + geom_point(size=3)
}
  
