# Executables are really big and really slow!

Nit tools are still in heavy developement, most well known optimisation technics are not yet implemented.

If size matters, you can also [[strip|http://linux.die.net/man/1/strip]] the executable.

However, since there is currently no shared libraries for Nit, each executable must enclose all used libraries.
