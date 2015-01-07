# Nit on Mac

Install `xcode` from the [[app store|https://itunes.apple.com/ca/app/xcode/id497799835?mt=12]]

## With macport

Install `macport` from [[https://distfiles.macports.org/MacPorts/]]

Install packages required to compile Nit and its tools

~~~sh
$ sudo port install boehmgc ccache graphviz libunwind-headers pkgconfig
~~~

Install and compile Nit

~~~sh
$ git clone http://nitlanguage.org/nit.git
$ cd nit
$ make
~~~

Install more package required by libs and to pass more tests

~~~sh
$ sudo port install curl libsdl2 libsdl2_image ncurses libevent
~~~

Run the tests (for fun)

~~~sh
$ cd tests
$ ./testfull.sh
~~~

## With brew

Install brew

~~~sh
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew doctor
~~~

Install packages

~~~sh
$ brew install boehmgc ccache graphviz libunwind-headers pkgconfig
~~~

Install and compile Nit

~~~sh
$ git clone http://nitlanguage.org/nit.git
$ cd nit
$ make
~~~
