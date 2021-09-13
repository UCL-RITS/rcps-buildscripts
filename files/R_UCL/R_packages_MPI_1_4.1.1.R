#===========================================================
#
# Install additional R packages used used for MPI support.
#
# June 2016
#
# Uodated May 2017 for OpenMPI 1.10.1
# Updated June 2018 to fix MPI support in R 3.5.0 - now using
#         mpi/openmpi/3.0.0/gnu-4.9.2
# Updated April 2020 for R 3.6.3  and GNU 9.2.0
# Updated September 2021 for R 4.1.1 and GNU 10.2.0 - now using
#         mpi/openmpi/4.0.5/gnu-10.2.0
# 
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

install.packages ("Rmpi", lib=mainLib, repos=repros, configure.args="--with-Rmpi-include=/shared/ucl/apps/openmpi/4.0.5/gnu-10.2.0/include --with-Rmpi-libpath=/shared/ucl/apps/openmpi/4.0.5/gnu-10.2.0/lib --with-Rmpi-type=OPENMPI");
install.packages ("snow", lib=mainLib, repos=repros);


# End of R_packages_MPI_1
