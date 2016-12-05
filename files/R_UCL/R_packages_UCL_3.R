#=====================================================================
#  R_packages_UCL_3
#
# Install third batch of add on R packages for UCL R instllations.
#
# June 2016

mainLib <- Sys.getenv ("RLIB_MAIN");
dbLib <- Sys.getenv ("RLIB_DB");
repros <- Sys.getenv ("REPROS");
mainLib;
dbLib;
repros;

# For Stefan Frank

install.packages ("Rcpp", lib=mainLib, repos=repros);
install.packages ("minqa", lib=mainLib, repos=repros);
install.packages ("nloptr", lib=mainLib, repos=repros);
install.packages ("RcppEigen", lib=mainLib, repos=repros);
install.packages ("lme4", lib=mainLib, repos=repros);

# For Julie Bertrand j.bertrand@ucl.ac.uk - Added Jan 2013

install.packages ("saemix", lib=mainLib, repos=repros);

# For Margarida Cabrita Lopes margarida.lopes@ucl.ac.uk

install.packages ("ncdf", lib=mainLib, repos=repros);
# install.packages ("RNetCDF", lib=mainLib, repos=repros);


# For Dr Jiaqiu Wang (jiaqiu.wang@ucl.ac.uk) (ucesjw0) - added March 2013

install.packages ("mclust", lib=mainLib, repos=repros);
install.packages ("fpc", lib=mainLib, repos=repros);

# For Dr Lucio Castilho (l.vinicius@ucl.ac.uk) - added April 2013

install.packages ("BaSTA", lib=mainLib, repos=repros);

# For Dr Xiayi Ke x.ke@ucl.ac.uk added June 2013

install.packages ("corpcor", lib=mainLib, repos=repros);

# For Adam Levine (a.levine@ucl.ac.uk) - added August 2013

install.packages ("dynamicTreeCut", lib=mainLib, repos=repros);
install.packages ("flashClust", lib=mainLib, repos=repros);
install.packages ("reshape", lib=mainLib, repos=repros);
install.packages ("doParallel", lib=mainLib, repos=repros);
install.packages ("WGCNA", lib=mainLib, repos=repros);

# For Dr Elsa Arcaute (e.arcaute@ucl.ac.uk) - added September 2013

install.packages ("igraph", lib=mainLib, repos=repros);

# For Dr Jiaqiu Wang (jiaqiu.wang@ucl.ac.uk) - added September 2013

install.packages ("inline", lib=mainLib, repos=repros);

# End of R_packages_UCL_3

