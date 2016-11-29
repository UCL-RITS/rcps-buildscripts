#===========================================================
#
# Install additional R packages used used for MPI support.
#
# June 2016

#=====================================================================
#  R_packages_MPI_1
#
# Install first batch of add on R packages for UCL R instllations.
#

mainLib <- Sys.getenv ("RLIB_MAIN");
dbLib <- Sys.getenv ("RLIB_DB");
repros <- Sys.getenv ("REPROS");
mainLib;
dbLib;
repros;

install.packages ("Rmpi", lib=mainLib, repos=repros, configure.args="--with-Rmpi-include=/shared/ucl/apps/openmpi/1.8.4/gnu-4.9.2/include --with-Rmpi-libpath=/shared/ucl/apps/openmpi/1.8.4/gnu-4.9.2/lib --with-Rmpi-type=OPENMPI");
install.packages ("snow", lib=mainLib, repos=repros);


# End of R_packages_MPI_1
