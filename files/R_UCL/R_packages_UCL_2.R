#=====================================================================
#  R_packages_UCL_2
#
# Install second batch of add on R packages for UCL R instllations.
#
# June 2016

mainLib <- Sys.getenv ("RLIB_MAIN");
dbLib <- Sys.getenv ("RLIB_DB");
repros <- Sys.getenv ("REPROS");
mainLib;
dbLib;
repros;

install.packages ("modeltools", lib=mainLib, repos=repros);
install.packages ("survival", lib=mainLib, repos=repros);
install.packages ("TH.data", lib=mainLib, repos=repros);
install.packages ("zoo", lib=mainLib, repos=repros);
install.packages ("sandwich", lib=mainLib, repos=repros);
install.packages ("multcomp", lib=mainLib, repos=repros);
install.packages ("flexmix", lib=mainLib, repos=repros);
install.packages ("gamlss.mx", lib=mainLib, repos=repros);
install.packages ("gamlss.nl", lib=mainLib, repos=repros);
install.packages ("gtools", lib=mainLib, repos=repros);
install.packages ("gdata", lib=mainLib, repos=repros);
install.packages ("genetics", lib=mainLib, repos=repros);
install.packages ("haplo.stats", lib=mainLib, repos=repros);
install.packages ("GenABEL.data", lib=mainLib, repos=repros);
install.packages ("GenABEL", lib=mainLib, repos=repros);
install.packages ("XML", lib=mainLib, repos=repros);
install.packages ("bitops", lib=mainLib, repos=repros);
install.packages ("RCurl", lib=mainLib, repos=repros);
install.packages ("expm", lib=mainLib, repos=repros);
install.packages ("msm", lib=mainLib, repos=repros);
install.packages ("DBI", lib=mainLib, repos=repros);
install.packages ("RSQLite", lib=mainLib, repos=repros);
install.packages ("R2HTML", lib=mainLib, repos=repros);
install.packages ("tkrplot", lib=mainLib, repos=repros);

# For Pascale Gerbault:

install.packages ("quadprog", lib=mainLib, repos=repros);
install.packages ("tseries", lib=mainLib, repos=repros);
install.packages ("SparseM", lib=mainLib, repos=repros);
install.packages ("quantreg", lib=mainLib, repos=repros);
install.packages ("akima", lib=mainLib, repos=repros);
install.packages ("locfit", lib=mainLib, repos=repros);
install.packages ("abc", lib=mainLib, repos=repros);

# For Mark Lake etc

install.packages ("iterators", lib=mainLib, repos=repros);
install.packages ("codetools", lib=mainLib, repos=repros);
install.packages ("foreach", lib=mainLib, repos=repros);

# Removed from CRAN for R 3.4.0 - use package ‘parallel’ instead.
#
# install.packages ("multicore", lib=mainLib, repos=repros);

install.packages ("doMC", lib=mainLib, repos=repros);
install.packages ("permute", lib=mainLib, repos=repros);
install.packages ("vegan", lib=mainLib, repos=repros);
install.packages ("metafor", lib=mainLib, repos=repros);
install.packages ("xtable", lib=mainLib, repos=repros);

# to help test Bioconductor using examples from R in a Nutshell

install.packages ("lpSolve", lib=mainLib, repos=repros);
install.packages ("sampling", lib=mainLib, repos=repros);
install.packages ("nutshell.bbdb", lib=mainLib, repos=repros);
install.packages ("nutshell.audioscrobbler", lib=mainLib, repos=repros);
install.packages ("nutshell", lib=mainLib, repos=repros);

# For Serge Guillas plus two packages that need to be installed from
# local files.

install.packages ("tgp", lib=mainLib, repos=repros);
install.packages ("spam", lib=mainLib, repos=repros);
install.packages ("maps", lib=mainLib, repos=repros);
install.packages ("fields", lib=mainLib, repos=repros);
install.packages ("pixmap", lib=mainLib, repos=repros);
install.packages ("sp", lib=mainLib, repos=repros);

# INLA needs to be downloaded from http://www.r-inla.org/:

install.packages("INLA", lib=mainLib, repos="https://www.math.ntnu.no/inla/R/stable")

# End of R_packages_UCL_2

