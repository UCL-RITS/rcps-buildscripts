#=====================================================================
#  Bioconductor_UCL_1
#
# Install Bioconductor for UCL R installations.
#
# June 2016
# Updated May 2017
# Updated April 2019 for Bioconductor 3.8 which uses a new installation 
# tool - BiocManager also addeded IlluminaHumanMethylationEPICanno.ilm10b4.hg19

mainLib <- Sys.getenv ("RLIB_MAIN");
dbLib <- Sys.getenv ("RLIB_DB");
repros <- Sys.getenv ("REPROS");
mainLib;
dbLib;
repros;

# Download the Bioconductor installer and install the base package

if (!requireNamespace ("BiocManager"))
    install.packages ("BiocManager", repos=repros)
BiocManager::install ()

# Install Bioconductor packages

BiocManager::install ("Biobase", type="source", lib=mainLib);
BiocManager::install ("qvalue", type="source", lib=mainLib);
BiocManager::install ("IRanges", type="source", lib=mainLib);
BiocManager::install ("GenomeInfoDb", type="source", lib=mainLib);
BiocManager::install ("AnnotationDbi", type="source", lib=mainLib);
BiocManager::install ("annotate", type="source", lib=mainLib);
BiocManager::install ("biomaRt", type="source", lib=mainLib);
BiocManager::install ("XVector", type="source", lib=mainLib);
BiocManager::install ("zlibbioc", type="source", lib=mainLib);
BiocManager::install ("Biostrings", type="source", lib=mainLib);
BiocManager::install ("DynDoc", type="source", lib=mainLib);
BiocManager::install ("affyio", type="source", lib=mainLib);
BiocManager::install ("preprocessCore", type="source", lib=mainLib);
BiocManager::install ("BiocInstaller", type="source", lib=mainLib);
BiocManager::install ("affy", type="source", lib=mainLib);
BiocManager::install ("gcrma", type="source", lib=mainLib);
BiocManager::install ("affyPLM", type="source", lib=mainLib);
BiocManager::install ("genefilter", type="source", lib=mainLib);
BiocManager::install ("simpleaffy", type="source", lib=mainLib);
BiocManager::install ("affyQCReport", type="source", lib=mainLib);
BiocManager::install ("affydata", type="source", lib=mainLib);

BiocManager::install ("GO.db", type="source", lib=dbLib);
BiocManager::install ("KEGG.db", type="source", lib=dbLib);

BiocManager::install ("annaffy", type="source", lib=mainLib);
BiocManager::install ("geneplotter", type="source", lib=mainLib);

BiocManager::install ("org.Hs.eg.db", type="source", lib=dbLib);
BiocManager::install ("hgu95av2.db", type="source", lib=dbLib);

BiocManager::install ("limma", type="source", lib=mainLib);
BiocManager::install ("marray", type="source", lib=mainLib);
BiocManager::install ("multtest", type="source", lib=mainLib);
BiocManager::install ("vsn", type="source", lib=mainLib);

# For Cristian Taccioli
#
# xps needs ROOT. New version (>= v5.34.05) needed for Bioconductor 2.12

BiocManager::install ("xps", type="source", lib=mainLib);
BiocManager::install ("affylmGUI", type="source", lib=mainLib);
BiocManager::install ("widgetTools", type="source", lib=mainLib);

# For Sakshi Gulati - added October 2012

BiocManager::install ("GenomicRanges", type="source", lib=mainLib);
BiocManager::install ("Rsamtools", type="source", lib=mainLib);
BiocManager::install ("BSgenome", type="source", lib=mainLib);
BiocManager::install ("BSgenome.Hsapiens.UCSC.hg19", type="source", lib=mainLib);
BiocManager::install ("BiocParallel", type="source", lib=mainLib);
BiocManager::install ("GenomicAlignments", type="source", lib=mainLib);
BiocManager::install ("rtracklayer", type="source", lib=mainLib);
BiocManager::install ("made4", type="source", lib=mainLib);
BiocManager::install ("graph", type="source", lib=mainLib);
BiocManager::install ("GSEABase", type="source", lib=mainLib);

BiocManager::install ("hugene10stprobeset.db", type="source", lib=dbLib);
BiocManager::install ("hugene10sttranscriptcluster.db", type="source", lib=dbLib);

# For Somdutta Dhir (somdutta.dhir@ucl.ac.uk) - added February 2013

BiocManager::install ("GenomeGraphs", type="source", lib=mainLib);
BiocManager::install ("GenomicFeatures", type="source", lib=mainLib);

# Removed from Bioconductor 3.5
BiocManager::install ("VariantAnnotation", type="source", lib=mainLib);

BiocManager::install ("biovizBase", type="source", lib=mainLib);
BiocManager::install ("Gviz", type="source", lib=mainLib);
BiocManager::install ("annmap", type="source", lib=mainLib);

# For Adam Levine (a.levine@ucl.ac.uk) - added August 2013

BiocManager::install ("impute", type="source", lib=mainLib);
install.packages ("WGCNA", lib=mainLib, repos=repros);

# For Dr Gioia Altobelli g.altobelli@ucl.ac.uk - added Oct 2013 updated Mar 2014

BiocManager::install ("edgeR", type="source", lib=mainLib);
BiocManager::install ("BeadDataPackR", type="source", lib=mainLib);
BiocManager::install ("illuminaio", type="source", lib=mainLib);
BiocManager::install ("beadarray", type="source", lib=mainLib);
BiocManager::install ("beadarrayExampleData", type="source", lib=mainLib);

BiocManager::install ("AnnotationForge", type="source", lib=dbLib);
BiocManager::install ("illuminaHumanv4.db", type="source", lib=dbLib);

# For Antonia Ford (a.ford.11@ucl.ac.uk) - added Jan 2014

BiocManager::install ("seqLogo", type="source", lib=mainLib);

# For Michela Leonardi (m.leonardi@ucl.ac.uk) - added June 2014

BiocManager::install ("RBGL", type="source", lib=mainLib);
BiocManager::install ("Category", type="source", lib=mainLib);
BiocManager::install ("GOstats", type="source", lib=mainLib);

# For Javier Herrero (javier.herrero@ucl.ac.uk) - added Sept 2014 - all new in BC 2.14

BiocManager::install ("DNAcopy", type="source", lib=mainLib);
BiocManager::install ("Ringo", type="source", lib=mainLib);
BiocManager::install ("affxparser", type="source", lib=mainLib);
BiocManager::install ("aroma.light", type="source", lib=mainLib);

install.packages ("aroma.apd", lib=mainLib, repos=repros);
install.packages ("aroma.affymetrix", lib=mainLib, repos=repros);

BiocManager::install ("Repitools", type="source", lib=mainLib);

# For Dapeng Wang (dapeng.wang@ucl.ac.uk) - added Sept 2014

BiocManager::install ("Rsubread", type="source", lib=mainLib);
BiocManager::install ("DESeq", type="source", lib=mainLib);
BiocManager::install ("genomeIntervals", type="source", lib=mainLib);
BiocManager::install ("ShortRead", type="source", lib=mainLib);
BiocManager::install ("easyRNASeq", type="source", lib=mainLib);
BiocManager::install ("DESeq2", type="source", lib=mainLib);

# For Ran Gu (ran.gu.10@ucl.ac.uk) - added Oct 2014

BiocManager::install ("RcppGSL", type="source", lib=mainLib);

# For Stuart Peters (stuart.peters.13@ucl.ac.uk) - added Feb 2015

BiocManager::install ("pls", type="source", lib=mainLib);

# For Xiayi Ke (sejjxke@ucl.ac.uk) - added Feb 2015

BiocManager::install ("registry", type="source", lib=mainLib);
BiocManager::install ("pkgmaker", type="source", lib=mainLib);
BiocManager::install ("rngtools", type="source", lib=mainLib);
BiocManager::install ("doRNG", type="source", lib=mainLib);
BiocManager::install ("bumphunter", type="source", lib=mainLib);
BiocManager::install ("beanplot", type="source", lib=mainLib);
BiocManager::install ("nor1mix", type="source", lib=mainLib);
BiocManager::install ("siggenes", type="source", lib=mainLib);
BiocManager::install ("minfi", type="source", lib=mainLib);
BiocManager::install ("ChAMPdata", type="source", lib=mainLib);

BiocManager::install ("Illumina450ProbeVariants.db", type="source", lib=dbLib);

BiocManager::install ("sva", type="source", lib=mainLib);

BiocManager::install ("IlluminaHumanMethylation450kmanifest", type="source", lib=dbLib);

BiocManager::install ("methylumi", type="source", lib=mainLib);
BiocManager::install ("nleqslv", type="source", lib=mainLib);
BiocManager::install ("lumi", type="source", lib=mainLib);

# BiocManager::install ("IlluminaHumanMethylation450k.db", type="source", lib=dbLib);
BiocManager::install ("FDb.InfiniumMethylation.hg19", type="source", lib=mainLib);
BiocManager::install ("IlluminaHumanMethylationEPICanno.ilm10b4.hg19", lib=mainLib); # Added April 2019

BiocManager::install ("ROC", type="source", lib=mainLib);
BiocManager::install ("wateRmelon", type="source", lib=mainLib);

# Removed from CRAN and Bioconductor for R 3.4.0
#
# BiocManager::install ("RPVM", type="source", lib=mainLib);

install.packages ("ruv", lib=mainLib, repos=repros);
BiocManager::install ("ChAMP", type="source", lib=mainLib);

# For Ana Paula Leite (ana.leite@ucl.ac.uk) - added June 2016

BiocManager::install ("EBSeq", type="source", lib=mainLib);

# Required for the cancerit suite (https://github.com/cancerit)

BiocManager::install ("copynumber", type="source", lib=mainLib);

# For Athina Dritsoula (athina.dritsoula.09@ucl.ac.uk) - added Feb and March 2017

BiocManager::install ("goseq", type="source", lib=mainLib);
BiocManager::install ("missMethyl", type="source", lib=dbLib);

# For Evgeny Galimov (e.galimov@ucl.ac.uk) - added Aug 2017

BiocManager::install ("DEXSeq", type="source", lib=mainLib);

# Additional CRAN packages
install.packages ("PSCBS", lib=mainLib, repos=repros);

# End of Bioconductor_UCL_1

# BiocManager::install ("XXX", type="source", lib=mainLib);

