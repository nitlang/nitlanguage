# # What is Nit?

Nit is an expressive language with a script-like syntax, a friendly type-system and aims at elegance, simplicity and intuitiveness.

So, what does the famous hello world program look like, in Nit?

~~~
print "Hello, World!"
~~~

# # Development

The Nit project is currently in alpha stage, at v0.8. It is in active development, moving fast and the APIs are still evolving.

You can follow the development on [Github](https://github.com/nitlang/nit/).

# # Why Nit?

## Usability
Nit's goal is to be usable by real programmers for real projects

* [[KISS|http://en.wikipedia.org/wiki/KISS_principle]] principle
* Script-like language without verbosity nor cryptic statements
* Painless static types: static typing should help programmers
* Efficient development, efficient execution, efficient evolution
* Easy bindings with C, C++, Java and Objective-C using the [[FFI|FFI]]
* [Android](http://nitlanguage.org/doc/stdlib/module_android__android.html) support in the compiler
* Smart autodoc, [[nitdoc|tools/nitdoc]], used to document the [[standard lib|http://nitlanguage.org/doc/stdlib/module_android__android.html]]

## Object-Oriented

Nit's guideline is to follow the most powerful OO principles

* [[Everything is an object|object_oriented_principles#Everything_is_an_Object]]
* [[Multiple inheritance|object_oriented_principles#Multiple_Inheritance]]
* [[Static open classes|object_oriented_principles#Class_Refinement]]
* [[Virtual types|object_oriented_principles#Virtual_Types]]

## Robustness

Nit will help you write bug-free programs

* Strong static typing
* No more NullPointerException

# # Published packages using Nit

* [Opportunity](catalog/p/opportunity.html), a free event planner
* [Nitiwiki](catalog/p/nitiwiki.html), the wiki engine used for the current website
* [Brewnit](catalog/p/brewnit.html), a tool for home brewers
* [A simple calculator](catalog/p/calculator.html) using GTK for desktop and the native UI for Android while sharing the business logic
* Bindings for [OpenGL ES 2.0](catalog/p/glesv2.html), [SDL 2.0](catalog/p/sdl2.html), [GTK 3](catalog/p/gtk.html), [sqlite3](catalog/p/sqlite3.html)
* Many libraries and program like the [webserver nitcorn](catalog/p/nitcorn.html), the [portable applications framework app.nit](catalog/p/app.html), and many other available in the [catalog](catalog/)

# # Getting Started

Get Nit from its Git repository:

~~~sh
$ git clone https://github.com/nitlang/nit.git
~~~

Ensure that dependencies (and recommendations) are installed:

~~~sh
# Eg. for Debian or Ubuntu
$ sudo apt-get install build-essential ccache libgc-dev libunwind-dev libreadline-dev pkg-config
~~~

Build the compiler (may be long):

~~~sh
$ cd nit
$ make
~~~

Setup your shell environment:

~~~sh
$ source misc/nit_env.sh
~~~

Compile a program:

~~~sh
$ nitc examples/hello_world.nit
~~~

Execute the program:

~~~sh
$ ./hello_world
~~~

And now?

* Install plugins for your [[editor or IDE|ide]] to work with Nit
* Read the language [[manual]]
* Browse the [[catalog of packages, programs and libraries|http://nitlanguage.org/catalog]]
* Try [[contributing|internal]] to the project
