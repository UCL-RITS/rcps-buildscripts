# Patches to make Boost 1.44.0 compile on modern Linux

Boost is moving target and unfortunately this means some applications that are 
written with boost need very old versions.  Versions of Boost from before 1.50 will not compile on systems with GCC > 4.7 due to changes in how the latter reports threading and the former supports `TIME_UTC` which is a genuine thing that exists in C++11 and so breaks boost.

These patches attempt to work around this by:

1. Fixing the check for posix threads availablility. (`_GLIBCXX__PTHREADS` to `_GLIBCXX_HAS_GTHREADS`)
2. Renaming `TIME_UTC` to `TIME_UTC_`.

Both of these are effectively backports for modern boost.
