#=====================================================================
#  R_packages_UCL_5
#
# Install 5th batch of add on R packages for UCL R instllations.
#
# June 2016

mainLib <- Sys.getenv ("RLIB_MAIN");
dbLib <- Sys.getenv ("RLIB_DB");
repros <- Sys.getenv ("REPROS");
mainLib;
dbLib;
repros;

#
# For Antonia Ford (a.ford.11@ucl.ac.uk) - added Jan 2014

install.packages ("rgl", lib=mainLib, repos=repros);
install.packages ("fastmatch", lib=mainLib, repos=repros);
install.packages ("phangorn", lib=mainLib, repos=repros);

# For JAGS - added March 2014

install.packages ("coda", lib=mainLib, repos=repros);
install.packages ("rjags", lib=mainLib, repos=repros);
install.packages ("abind", lib=mainLib, repos=repros);
install.packages ("R2WinBUGS", lib=mainLib, repos=repros);
install.packages ("R2jags", lib=mainLib, repos=repros);

# For Stuart Peters (stuart.peters.13@ucl.ac.uk) June 2014

install.packages ("httpuv", lib=mainLib, repos=repros);
install.packages ("RJSONIO", lib=mainLib, repos=repros);
install.packages ("digest", lib=mainLib, repos=repros);
install.packages ("htmltools", lib=mainLib, repos=repros);
install.packages ("caTools", lib=mainLib, repos=repros);
install.packages ("shiny", lib=mainLib, repos=repros);
install.packages ("ade4", lib=mainLib, repos=repros);
install.packages ("ape", lib=mainLib, repos=repros);
install.packages ("plyr", lib=mainLib, repos=repros);
install.packages ("labeling", lib=mainLib, repos=repros);
install.packages ("dichromat", lib=mainLib, repos=repros);
install.packages ("colorspace", lib=mainLib, repos=repros);
install.packages ("munsell", lib=mainLib, repos=repros);
install.packages ("scales", lib=mainLib, repos=repros);
install.packages ("gtable", lib=mainLib, repos=repros);
install.packages ("stringr", lib=mainLib, repos=repros);
install.packages ("reshape2", lib=mainLib, repos=repros);
install.packages ("proto", lib=mainLib, repos=repros);
install.packages ("ggplot2", lib=mainLib, repos=repros);
install.packages ("adegenet", lib=mainLib, repos=repros);
install.packages ("pegas", lib=mainLib, repos=repros);
install.packages ("stringdist", lib=mainLib, repos=repros);

# For Rodrigo Targino (r.targino.12@ucl.ac.uk) July 2014

install.packages ("HAC", lib=mainLib, repos=repros);

# For Mattia Cinelli (rebmmci@ucl.ac.uk) Nov 2014

install.packages ("e1071", lib=mainLib, repos=repros);

# Extra R packages needed for various Bioconductor packages.

install.packages ("gplots", lib=mainLib, repos=repros);
install.packages ("checkmate", lib=mainLib, repos=repros);
install.packages ("BBmisc", lib=mainLib, repos=repros);
install.packages ("base64enc", lib=mainLib, repos=repros);
install.packages ("sendmailR", lib=mainLib, repos=repros);
install.packages ("brew", lib=mainLib, repos=repros);
install.packages ("fail", lib=mainLib, repos=repros);
install.packages ("BatchJobs", lib=mainLib, repos=repros);
install.packages ("RMySQL", lib=mainLib, repos=repros);
install.packages ("R.methodsS3", lib=mainLib, repos=repros);
install.packages ("matrixStats", lib=mainLib, repos=repros);
install.packages ("base64", lib=mainLib, repos=repros);
install.packages ("gsmoothr", lib=mainLib, repos=repros);
install.packages ("R.cache", lib=mainLib, repos=repros);
install.packages ("R.filesets", lib=mainLib, repos=repros);
install.packages ("R.devices", lib=mainLib, repos=repros);
install.packages ("R.rsp", lib=mainLib, repos=repros);
install.packages ("PSCBS", lib=mainLib, repos=repros);
install.packages ("aroma.core", lib=mainLib, repos=repros);
install.packages ("R.huge", lib=mainLib, repos=repros);
install.packages ("truncnorm", lib=mainLib, repos=repros);
install.packages ("Rsolnp", lib=mainLib, repos=repros);
install.packages ("intervals", lib=mainLib, repos=repros);
install.packages ("colorRamps", lib=mainLib, repos=repros);
install.packages ("schoolmath", lib=mainLib, repos=repros);
install.packages ("LSD", lib=mainLib, repos=repros);
install.packages ("RcppArmadillo", lib=mainLib, repos=repros);

# For Matthew Jones (m.jones.12@ucl.ac.uk) June 2016 new in R 3.3.0

install.packages ("rstanarm", lib=mainLib, repos=repros);

# Required for the cancerit suite (https://github.com/cancerit)

install.packages ("gam", lib=mainLib, repos=repros);
install.packages ("VGAM", lib=mainLib, repos=repros);
install.packages ("poweRlaw", lib=mainLib, repos=repros);

# For Zahra Sabetsarvestani (ucakzsa@ucl.ac.uk) Aug 2016

install.packages ("mlr", lib=mainLib, repos=repros);
install.packages ("pracma", lib=mainLib, repos=repros);
install.packages ("softImpute", lib=mainLib, repos=repros);
install.packages ("caret", lib=mainLib, repos=repros);
install.packages ("quantreg", lib=mainLib, repos=repros);
install.packages ("randomForest", lib=mainLib, repos=repros);

# For Slava Mikhaylov from political science Sep 2016

install.packages ("relaimpo", lib=mainLib, repos=repros);
install.packages ("GGally", lib=mainLib, repos=repros);
install.packages ("effects", lib=mainLib, repos=repros);
install.packages ("HotDeckImputation", lib=mainLib, repos=repros);
install.packages ("psych", lib=mainLib, repos=repros);

# End of R_packages_UCL_5

# install.packages ("XXX", lib=mainLib, repos=repros);
