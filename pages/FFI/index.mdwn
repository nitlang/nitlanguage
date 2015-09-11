# Supported foreign languages

The Nit language currently supports 3 foreign languages: C, C++ and Java. 

~~~pandoc
|                    | C | C++  | Objective-C | Java |
|-------------------:|:---:|:----:|:----:|:----:|
| Extern method      | x   | x    | x    | x    |
| Callback to method | x   | x    | x    | x    |
| Callback to super  | x   | x    | x    |      |
| Casts, etc.        | x   | x    | x    |      |
| Static types       | x   | x    | x    |      |
~~~

Table 1: Supported features in each FFI


[[FFI with C]] describes the interface between Nit and C. Which allows to implement Nit methods directly in C code, and more.

There's also a guide to develop Nit [[wrappers for existing C libraries|wrapping C libraries]] to access their features through normal Nit modules.

[[FFI with Java]] describes the interface with Java.

[[Nit on Android]] gives some guide lines on how to develop for Android in Nit.
