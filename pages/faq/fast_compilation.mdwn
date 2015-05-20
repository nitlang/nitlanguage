# The compiler is slow to compile

The current Nit compiler generates C code then invoke a C compiler to produce the final executable.
It is this part that takes the most time in the whole compilation process.

The best way to improve the recompilation time is to install [[ccache|http://ccache.samba.org/]] (`apt-get install ccache`). Nit will then automatically use it.
