#===========================================================
#
# Install additional R packages used at UCL part 1
#
# June 2016

#=====================================================================
#  R_packages_UCL_1
#
# Install first batch of add on R packages for UCL R instllations.
#

mainLib <- Sys.getenv ("RLIB_MAIN");
dbLib <- Sys.getenv ("RLIB_DB");
repros <- Sys.getenv ("REPROS");
mainLib;
dbLib;
repros;

install.packages ("mvtnorm", lib=mainLib, repos=repros);
install.packages ("scatterplot3d", lib=mainLib, repos=repros);
install.packages ("mnormt", lib=mainLib, repos=repros);
install.packages ("numDeriv", lib=mainLib, repos=repros);
install.packages ("sn", lib=mainLib, repos=repros);
install.packages ("pspline", lib=mainLib, repos=repros);
install.packages ("gsl", lib=mainLib, repos=repros);
install.packages ("ADGofTest", lib=mainLib, repos=repros);
install.packages ("stabledist", lib=mainLib, repos=repros);
install.packages ("copula", lib=mainLib, repos=repros);
install.packages ("combinat", lib=mainLib, repos=repros);
install.packages ("Formula", lib=mainLib, repos=repros);
install.packages ("RColorBrewer", lib=mainLib, repos=repros);
install.packages ("latticeExtra", lib=mainLib, repos=repros);
install.packages ("Hmisc", lib=mainLib, repos=repros);


# End of R_packages_UCL_1
