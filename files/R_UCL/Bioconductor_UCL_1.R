#=====================================================================
#  Bioconductor_UCL_1
#
# Install Bioconductor for UCL R installations.
#
# June 2016
# Updated May 2017

mainLib <- Sys.getenv ("RLIB_MAIN");
dbLib <- Sys.getenv ("RLIB_DB");
repros <- Sys.getenv ("REPROS");
mainLib;
dbLib;
repros;

# Download the Bioconductor installer.

source ("https://bioconductor.org/biocLite.R");

biocLite (pkgs="Biobase", type="source", lib=mainLib);
biocLite (pkgs="qvalue", type="source", lib=mainLib);
biocLite (pkgs="IRanges", type="source", lib=mainLib);
biocLite (pkgs="GenomeInfoDb", type="source", lib=mainLib);
biocLite (pkgs="AnnotationDbi", type="source", lib=mainLib);
biocLite (pkgs="annotate", type="source", lib=mainLib);
biocLite (pkgs="biomaRt", type="source", lib=mainLib);
biocLite (pkgs="XVector", type="source", lib=mainLib);
biocLite (pkgs="zlibbioc", type="source", lib=mainLib);
biocLite (pkgs="Biostrings", type="source", lib=mainLib);
biocLite (pkgs="DynDoc", type="source", lib=mainLib);
biocLite (pkgs="affyio", type="source", lib=mainLib);
biocLite (pkgs="preprocessCore", type="source", lib=mainLib);
biocLite (pkgs="BiocInstaller", type="source", lib=mainLib);
biocLite (pkgs="affy", type="source", lib=mainLib);
biocLite (pkgs="gcrma", type="source", lib=mainLib);
biocLite (pkgs="affyPLM", type="source", lib=mainLib);
biocLite (pkgs="genefilter", type="source", lib=mainLib);
biocLite (pkgs="simpleaffy", type="source", lib=mainLib);
biocLite (pkgs="affyQCReport", type="source", lib=mainLib);
biocLite (pkgs="affydata", type="source", lib=mainLib);

biocLite (pkgs="GO.db", type="source", lib=dbLib);
biocLite (pkgs="KEGG.db", type="source", lib=dbLib);

biocLite (pkgs="annaffy", type="source", lib=mainLib);
biocLite (pkgs="geneplotter", type="source", lib=mainLib);

biocLite (pkgs="org.Hs.eg.db", type="source", lib=dbLib);
biocLite (pkgs="hgu95av2.db", type="source", lib=dbLib);

biocLite (pkgs="limma", type="source", lib=mainLib);
biocLite (pkgs="marray", type="source", lib=mainLib);
biocLite (pkgs="multtest", type="source", lib=mainLib);
biocLite (pkgs="vsn", type="source", lib=mainLib);

# For Cristian Taccioli
#
# xps needs ROOT. New version (>= v5.34.05) needed for Bioconductor 2.12

biocLite (pkgs="xps", type="source", lib=mainLib);
biocLite (pkgs="affylmGUI", type="source", lib=mainLib);
biocLite (pkgs="widgetTools", type="source", lib=mainLib);

# For Sakshi Gulati - added October 2012

biocLite (pkgs="GenomicRanges", type="source", lib=mainLib);
biocLite (pkgs="Rsamtools", type="source", lib=mainLib);
biocLite (pkgs="BSgenome", type="source", lib=mainLib);
biocLite (pkgs="BSgenome.Hsapiens.UCSC.hg19", type="source", lib=mainLib);
biocLite (pkgs="BiocParallel", type="source", lib=mainLib);
biocLite (pkgs="GenomicAlignments", type="source", lib=mainLib);
biocLite (pkgs="rtracklayer", type="source", lib=mainLib);
biocLite (pkgs="made4", type="source", lib=mainLib);
biocLite (pkgs="graph", type="source", lib=mainLib);
biocLite (pkgs="GSEABase", type="source", lib=mainLib);

biocLite (pkgs="hugene10stprobeset.db", type="source", lib=dbLib);
biocLite (pkgs="hugene10sttranscriptcluster.db", type="source", lib=dbLib);

# For Somdutta Dhir (somdutta.dhir@ucl.ac.uk) - added February 2013

biocLite (pkgs="GenomeGraphs", type="source", lib=mainLib);
biocLite (pkgs="GenomicFeatures", type="source", lib=mainLib);

# Removed from Bioconductor 3.5
# biocLite (pkgs="VariantAnnotation", type="source", lib=mainLib);

biocLite (pkgs="biovizBase", type="source", lib=mainLib);
biocLite (pkgs="Gviz", type="source", lib=mainLib);
biocLite (pkgs="annmap", type="source", lib=mainLib);

# For Adam Levine (a.levine@ucl.ac.uk) - added August 2013

biocLite (pkgs="impute", type="source", lib=mainLib);

# For Dr Gioia Altobelli g.altobelli@ucl.ac.uk - added Oct 2013 updated Mar 2014

biocLite (pkgs="edgeR", type="source", lib=mainLib);
biocLite (pkgs="BeadDataPackR", type="source", lib=mainLib);
biocLite (pkgs="illuminaio", type="source", lib=mainLib);
biocLite (pkgs="beadarray", type="source", lib=mainLib);
biocLite (pkgs="beadarrayExampleData", type="source", lib=mainLib);

biocLite (pkgs="AnnotationForge", type="source", lib=dbLib);
biocLite (pkgs="illuminaHumanv4.db", type="source", lib=dbLib);

# For Antonia Ford (a.ford.11@ucl.ac.uk) - added Jan 2014

biocLite (pkgs="seqLogo", type="source", lib=mainLib);

# For Michela Leonardi (m.leonardi@ucl.ac.uk) - added June 2014

biocLite (pkgs="RBGL", type="source", lib=mainLib);
biocLite (pkgs="Category", type="source", lib=mainLib);
biocLite (pkgs="GOstats", type="source", lib=mainLib);

# For Javier Herrero (javier.herrero@ucl.ac.uk) - added Sept 2014 - all new in BC 2.14

biocLite (pkgs="DNAcopy", type="source", lib=mainLib);
biocLite (pkgs="Ringo", type="source", lib=mainLib);
biocLite (pkgs="affxparser", type="source", lib=mainLib);
biocLite (pkgs="aroma.light", type="source", lib=mainLib);

install.packages ("aroma.apd", lib=mainLib, repos=repros);
install.packages ("aroma.affymetrix", lib=mainLib, repos=repros);

biocLite (pkgs="Repitools", type="source", lib=mainLib);

# For Dapeng Wang (dapeng.wang@ucl.ac.uk) - added Sept 2014

biocLite (pkgs="Rsubread", type="source", lib=mainLib);
biocLite (pkgs="DESeq", type="source", lib=mainLib);
biocLite (pkgs="genomeIntervals", type="source", lib=mainLib);
biocLite (pkgs="ShortRead", type="source", lib=mainLib);
biocLite (pkgs="easyRNASeq", type="source", lib=mainLib);
biocLite (pkgs="DESeq2", type="source", lib=mainLib);

# For Ran Gu (ran.gu.10@ucl.ac.uk) - added Oct 2014

biocLite (pkgs="RcppGSL", type="source", lib=mainLib);

# For Stuart Peters (stuart.peters.13@ucl.ac.uk) - added Feb 2015

biocLite (pkgs="pls", type="source", lib=mainLib);

# For Xiayi Ke (sejjxke@ucl.ac.uk) - added Feb 2015

biocLite (pkgs="registry", type="source", lib=mainLib);
biocLite (pkgs="pkgmaker", type="source", lib=mainLib);
biocLite (pkgs="rngtools", type="source", lib=mainLib);
biocLite (pkgs="doRNG", type="source", lib=mainLib);
biocLite (pkgs="bumphunter", type="source", lib=mainLib);
biocLite (pkgs="beanplot", type="source", lib=mainLib);
biocLite (pkgs="nor1mix", type="source", lib=mainLib);
biocLite (pkgs="siggenes", type="source", lib=mainLib);
biocLite (pkgs="minfi", type="source", lib=mainLib);
biocLite (pkgs="ChAMPdata", type="source", lib=mainLib);

biocLite (pkgs="Illumina450ProbeVariants.db", type="source", lib=dbLib);

biocLite (pkgs="sva", type="source", lib=mainLib);

biocLite (pkgs="IlluminaHumanMethylation450kmanifest", type="source", lib=dbLib);

biocLite (pkgs="methylumi", type="source", lib=mainLib);
biocLite (pkgs="nleqslv", type="source", lib=mainLib);
biocLite (pkgs="lumi", type="source", lib=mainLib);

# biocLite (pkgs="IlluminaHumanMethylation450k.db", type="source", lib=dbLib);
biocLite (pkgs="FDb.InfiniumMethylation.hg19", type="source", lib=mainLib);

biocLite (pkgs="ROC", type="source", lib=mainLib);
biocLite (pkgs="wateRmelon", type="source", lib=mainLib);

# Removed from CRAN and Bioconductor for R 3.4.0
#
# biocLite (pkgs="RPVM", type="source", lib=mainLib);

biocLite (pkgs="ChAMP", type="source", lib=mainLib);

# For Ana Paula Leite (ana.leite@ucl.ac.uk) - added June 2016

biocLite (pkgs="EBSeq", type="source", lib=mainLib);

# Required for the cancerit suite (https://github.com/cancerit)

biocLite (pkgs="copynumber", type="source", lib=mainLib);

# For Athina Dritsoula (athina.dritsoula.09@ucl.ac.uk) - added Feb and March 2017

biocLite (pkgs="goseq", type="source", lib=mainLib);
biocLite (pkgs="missMethyl", type="source", lib=dbLib);

# End of Bioconductor_UCL_1

# biocLite (pkgs="XXX", type="source", lib=mainLib);

