#=====================================================================
#  R_packages_UCL_4
#
# Install 4th batch of add on R packages for UCL R instllations.
#
# June 2016

mainLib <- Sys.getenv ("RLIB_MAIN");
dbLib <- Sys.getenv ("RLIB_DB");
repros <- Sys.getenv ("REPROS");
mainLib;
dbLib;
repros;

# For Dr Gioia Altobelli g.altobelli@ucl.ac.uk - added Oct 2013 updated Mar 2014

install.packages ("hwriter", lib=mainLib, repos=repros);
install.packages ("statmod", lib=mainLib, repos=repros);

# For Fani Deligianni (f.deligianni@ucl.ac.uk) - added Nov 2013

install.packages ("glmnet", lib=mainLib, repos=repros);
install.packages ("ppls", lib=mainLib, repos=repros);
install.packages ("mstate", lib=mainLib, repos=repros);
install.packages ("etm", lib=mainLib, repos=repros);
install.packages ("Epi", lib=mainLib, repos=repros);
install.packages ("longitudinal", lib=mainLib, repos=repros);
install.packages ("fdrtool", lib=mainLib, repos=repros);
install.packages ("GeneNet", lib=mainLib, repos=repros);
install.packages ("parcor", lib=mainLib, repos=repros);

# For Marco Geraci (m.geraci@ucl.ac.uk) - added Dec 2013

install.packages ("HI", lib=mainLib, repos=repros);
install.packages ("car", lib=mainLib, repos=repros);
install.packages ("ellipse", lib=mainLib, repos=repros);
install.packages ("leaps", lib=mainLib, repos=repros);
install.packages ("FactoMineR", lib=mainLib, repos=repros);
install.packages ("R.methodsS3", lib=mainLib, repos=repros);
install.packages ("R.oo", lib=mainLib, repos=repros);
install.packages ("R.utils", lib=mainLib, repos=repros);
install.packages ("mcmc", lib=mainLib, repos=repros);


# End of R_packages_UCL_4

