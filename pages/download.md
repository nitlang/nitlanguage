# Download and install

## Download

Nit is still in heavy development.

The main way to get to get it from its [[git repository|https://github.com/nitlang/nit.git]]

~~~sh
$ git clone https://github.com/nitlang/nit.git
~~~sh

or to download the latest [[snapshot|https://github.com/nitlang/nit/archive/refs/heads/master.tar.gz]] (tar.gz)


## Get dependencies

~~~sh
# Eg. for Debian Jessie (8.0)
$ sudo apt-get install build-essential ccache libgc-dev graphviz libunwind-dev pkg-config
# Older versions of Debian or Ubuntu need `libunwind8-dev` or `libunwind7-dev`
~~~

## Build

In the `nit` directory, just call `make`

~~~sh
$ cd nit
$ make
~~~

## Install

Currently, there is no official installation process, the tools and lib should just works in place.

It is possible to configure your shell environment (`PATH`, `MANPATH`, bash completion) with the script `misc/nit-env.sh`.

~~~sh
$ source misc/nit_env.sh
~~~

It can also register itself in the user's `.profile` for future sessions with:

~~~sh
$ source misc/nit_env.sh install
~~~
