target_compile="gfortran -O2 -funroll-loops -ffree-form -ffree-line-length-none -ftree-vectorize -march=native -cpp -finline-functions -fopenmp"

blas_linking="-L/shared/ucl/apps/openblas/0.2.14/gnu-4.9.2/lib -lopenblas"

host_compile="gfortran -O2"
