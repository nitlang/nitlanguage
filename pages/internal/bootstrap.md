# Starting and Re-Bootstrapping

The Nit tools are written in Nit, it means you need a Nit compiler in order to compile the Nit compiler.

During the make, the original Nit compiler is compiled from C code (in `/c_src`).

~~~sh
$ git clone http://nitlanguage.org/nit.git
$ cd nit
$ make
$ cd src
$ ./ncall.sh
~~~

`ncall.sh` performs a full bootstrap of the compiler (the original `make` does only two passes).
More specifically, `ncall.sh`:

* compiles nitc.nit with the compiler `c_src/nitg` so we get `src/nitc`
* compiles nitc.nit with `src/nitc` and we get `src/nitc_2`
* compiles nitc.nit with `src/nitc_2` and we get `src/nitc_3`
* compiles nitc.nit with `src/nitc_3` and we get `src/nitc_4`
* compile `examples/hello_world.nit` with `src/nitc_4` and run it to verify that `src/nitc_4` is minimally functional.

Note that the Nit code of the compiler is written with some legacy Nit: all modern functionalities of Nit are not always usable since it is the primitive compiler (`c_src/nitg`) that is used.

One of the standard error of the nit tool developer is to break the bootstrap, it means that the Nit compiler is written in an incompatible way with the primitive compiler.
Regularly executing `./ncall.sh` helps to check that the bootstrap is not broken.

On some occasions, the C-code in `c_src` is updated.
The script `src/mkcsrc` is then used to regenerate a new `c_src` file by running a special compilation of nitc.
