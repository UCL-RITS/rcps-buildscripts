#=====================================================================
#  R_packages_UCL_5
#
# Install 5th batch of add on R packages for UCL R instllations.
#
# June 2016
# Latest update April 2019

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
install.packages ("shiny", lib=mainLib, repos=repros);
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
# install.packages ("PSCBS", lib=mainLib, repos=repros);
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

# For use with snow examples

install.packages ("rlecuyer", lib=mainLib, repos=repros);

install.packages ("devtools", lib=mainLib, repos=repros);

# More requsts from Political Science

# Install sf from GitHub repository

sfconf <- '--with-proj-api=yes --with-proj-lib=/shared/ucl/apps/PROJ.4/6.1.0/lib --with-proj-share=/shared/ucl/apps/PROJ.4/6.1.0/share/proj PROJ_CPPFLAGS="${PROJ_CPPFLAGS} -DACCEPT_USE_OF_DEPRECATED_PROJ_API_H -DHAVE_PROJ_H"';
devtools::install_github("r-spatial/sf", configure.args=sfconf);

install.packages ("rgdal", lib=mainLib, repos=repros);
install.packages ("rgeos", lib=mainLib, repos=repros);

install.packages ("erer", lib=mainLib, repos=repros);
install.packages ("panelAR", lib=mainLib, repos=repros);
install.packages ("arm", lib=mainLib, repos=repros);
install.packages ("systemfit", lib=mainLib, repos=repros);

# tmap requested by James Cheshire, Geography
# install V8's dependencies first, otherwise v8conf variables get lost in the interim
install.packages("Rcpp", lib=mainLib, repos=repros);
install.packages("jsonlite", lib=mainLib, repos=repros);
install.packages("curl", lib=mainLib, repos=repros);
v8conf <- 'INCLUDE_DIR=/shared/ucl/apps/v8/3.15/v8/include LIB_DIR=/shared/ucl/apps/v8/3.15/v8/out/x64.release/lib.target';
install.packages ("V8", lib=mainLib, repos=repros, configure.vars=v8conf);
udunits2Conf <- '--with-udunits2-include=/shared/ucl/apps/UDUNITS/2.2.20-gnu-4.9.2/include --with-udunits2-lib=/shared/ucl/apps/UDUNITS/2.2.20-gnu-4.9.2/lib';
install.packages ("udunits2", lib=mainLib, repos=repros, configure.args=udunits2Conf);
lwgeomconf <- 'CFLAGS="${CFLAGS} -DACCEPT_USE_OF_DEPRECATED_PROJ_API_H=1" PROJ_CPPFLAGS="${PROJ_CPPFLAGS} -DACCEPT_USE_OF_DEPRECATED_PROJ_API_H=1"';
install.packages ("lwgeom", lib=mainLib, repos=repros, configure.vars=lwgeomconf);
install.packages ("tmap", lib=mainLib, repos=repros);

# For Lucia Conde (l.conde@ucl.ac.uk) May 2017
install.packages ("rmarkdown", lib=mainLib, repos=repros);

# For RStudio server Oct 2017
install.packages ("tidyverse", lib=mainLib, repos=repros);

# For Cheng Zhang (cheng.zhang@ucl.ac.uk) March 2018
install.packages ("bio3d", lib=mainLib, repos=repros);

# For Cheng Zhang  (cheng.zhang@ucl.ac.uk) May 2018
install.packages ("png", lib=mainLib, repos=repros);

# For Laura Zieger (l.zieger@ucl.ac.uk) Dec 2018
install.packages ("TAM", lib=mainLib, repos=repros);

# For Tom O'Grady (t.o'grady@ucl.ac.uk) April 2019
devtools::install_github("jamesdunham/dgo");

# For Kasia Kozdon (k.kozdon.11@ucl.ac.uk) April 2019
install.packages ("kohonen", lib=mainLib, repos=repros);

# From RITS drop in session 25th June 2019
install.packages ("GJRM", lib=mainLib, repos=repros);
install.packages ("rlist", lib=mainLib, repos=repros);

# End of R_packages_UCL_5

# install.packages ("XXX", lib=mainLib, repos=repros);
