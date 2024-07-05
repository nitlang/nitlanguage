# Nit Tools

### The Compiler [[nitc]]

`nitc` is the current official Nit compiler.
It takes the main module of a Nit program as argument and produce an executable file.

* [[nitc manpage|nitc]]


### The Interpreter and Debugger [[nit]]

`nit` is the current official interpreter.
It takes the main module of a program as the first arguments then the option and commands of the program.

`nit` also includes an interactive debugger, it supports basics commands used for debugging a program much like GDB or such.

* [[nit manpage|nit]]

<a id="nitdoc"></a>
### The Documentation Generator [[nitdoc]]

`nitdoc` takes one or more modules and generate HTML pages of API documentation for these modules and their imported modules.

* [[nitdoc manpage|nitdoc]]

### The Unit Tester [[nitunit]]

`nitunit` executes the unit tests from Nit source files.

* [[nitunit manpage|nitunit]]

### The Metrics Collector [[nitmetrics]]

`nitmetrics` gathers some statistics about a Nit programs or modules.

It counts various number of entities and generates some graphs (with graphviz)

* [[nitmetrics manpage|nitmetrics]]

### The Code Highligher [[nitlight]]

`nitlight`, generates HTML of highlighted code from Nit source files.

* [[nitlight manpage|nitlight]]

### Other Tools

* [[nitdbg_client]], network client for remote debugging.
* [[nitls]], lists package and path of Nit source files.
* [[nitpick]], collects potential style and code issues.
* [[nitpretty]], pretty prints Nit code from Nit source files.
* [[nitserial]], generates serialization support modules.
* [[nitx]], displays specific pieces of API information from Nit source files.
