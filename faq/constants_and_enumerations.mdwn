# Constants and enumerations

Currently, there is now way to define constants or enumerations in Nit.

Various workarounds exist but there is no clear really better approaches.

## Constants as immediate top-level functions

Advantages:

* simple
* should be optimized with --global and --semi-global

Disadvantages:

* does not work if some caching is needed

~~~
# A bad approximation of pi.
# Or a very good for a Manhattan geometry.
fun imprecise_pi: Float do return 4.0

print imprecise_pi
~~~

## Constants as attributes of `Sys`

`Sys` is the only global object, so its attributes are global,
so one can use `Sys` as a big global state.

These attributes can also be marked as `lazy` to delay the allocations to the first use.

Advantages:

* works for complex constants

Disadvantages:

* ugly
* broke the isolation of the memory
* ugly

~~~
redef class Sys
    # A very bad approximation of pi.
    # Or a very good for a Chebyshev geometry.
    var really_imprecise_pi = 8.0 is readonly
end

print sys.really_imprecise_pi
~~~


## Constants as *onced* top-level functions

`once` is a low-level undocumented facility that evaluates an expression only once in the live of the program)

Because it is low-level and undocumented, please do not complain if it brakes your programs or your heart.

Advantages:

* works for complex constants
* does not hijack `Sys`

Disadvantages:

* bad
* fragile
* ugly

~~~
# A complex number
class Complex
   var real: Float
   var imag: Float
end

# The complex number 0 (0+0i)
fun cpx_0: Complex do return once new Complex(0.0, 0.0)
# The complex number 1 (1+0i)
fun cpx_1: Complex do return once new Complex(1.0, 0.0)
# The complex number i (0+1i)
fun cpx_i: Complex do return once new Complex(0.0, 1.0)
~~~

## Enumerations as Int

Just use integers to code the values of the enumerations.

Advantages:

* simple
* fast

Disadvantages:

* no reification
* no fine-typing
* no static control of range

For example, it is used for the `<=>` of comparable tat returns -1, 0 or +1.

~~~
class Node
    # Status of the node in the search.
    # Use:
    # * 0 for unmarked (not discovered)
    # * 1 for open (to process)
    # * 2 for closed (already processed)
    var mark: Int
end
~~~

## Enumerations a singleton objects

Create a class and specific instances to code the enumeration.

Advantages:

* It the nearest form of what reified enumerations should look like.
* Values of the enumerations are genuine objects instances of genuine classes.

Disadvantage:

* A lot of code
* Where, when, and by who the values are allocation and initialized is not optimal. See the workarounds used for constants at the top of this page.

~~~
class Node
    # Status of the node in the search.
    var mark: NodeMark
end

# The status of a `Node` in a search.
#
# Available values are
#
#   * `sys.unmarked`
#   * `sys.open`
#   * `sys.closed`
class NodeMark
    # Additional fields and services can be used
    var value: Int
end

redef class Sys
    # unmarked (not discovered)
    var unmarked = new NodeMark(0) is readonly
    # open (to process)
    var open = new NodeMark(1) is readonly
    # closed (already processed)
    var closed = new NodeMark(2) is readonly
end
~~~

## Enumerations as FFI Int

This use the FFI to create a extern type bounded on `int`.

Advantages:

* type distinct of Int but usable as a C int on the C side.

Disadvantages:

* unusable with the interpreter
* possible additional work for the GC.
* abuse of the `new` factories

This is mainly used on wrapper of C libraries that use `int` to code enumerations or flags.

~~~
class Node
    # Status of the node in the search.
   var mark: NodeMark
end

extern class NodeMark `{ int `}
    # unmarked (not discovered)
   new unmarked `{ return 0; `}
    # open (to process)
   new open `{ return 1; `}
    # closed (already processed)
   new closed `{ return 2; `}
end
~~~
