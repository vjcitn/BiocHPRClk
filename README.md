# BiocHPRClk

A look at the pangenome consortium resources in AnVIL

As of July 17 2023:

- when used with a suitable copy of [the HPRC AnVIL workspace](https://app.terra.bio/#workspaces/anvil-datastorage/AnVIL_HPRC), `grabtabs()` provides interactive access to contents of all data tables,
exposing Google Storage identifiers for BAM, VCF, minigraph, etc.

- `data(vcf1Mb)` provides a VariantAnnotation CollapsedVCF instance with calls for the first 1Mb
of chr1, using GRCh38 addresses

- `data(minigr_GRCh38)` provides a GRanges that encodes the bb.bed file for HPRC 1.0 with
bubble addresses in GRCh38

- `data(minigr_chm13)` provides a GRanges that encodes the bb.bed file for HPRC 1.0 with (more)
bubble addresses in T2T (CHM13)

