# Everything is an Object

In Nit, all data, even primitive stuff like integers and booleans, are objects.
It means :

### They are subtype of Object

~~~
fun foo(o: Object) do print "I am {o}, the {o.class_name}"
foo(4)    # -> I am 4, the Int
foo(true) # -> I am true, the Bool
~~~

### Their classes can be [[refined|#Class_Refinement]]

~~~
redef class Int
    fun double: Int do return self * 2
end
print 12.double # -> 24
~~~

### And it is real

It is not just some automatic boxing (a la Java 1.5).

~~~
var a: Object = 5
var b: Object = 3 + 2
print a == b # -> true
print a.is_same_instance(b) # -> true
~~~

# Module

In Nit, a program consists of a collection of modules.
A module in Nit serves the following purposes:

  * grouping classes and methods related to a single concern
  * controlling visibility and name-spaces
  * controlling [[refinement|#Class_Refinement]] of classes

Modules are connected by importation links (with the keyword `import`) and a Nit program is simply a module that imports all the other modules.

Note that the importation between modules cannot be circular.

By default, the module `standard` is imported by every modules.
It contains some basic classes and methods usually expected by the developers.


# Multiple Inheritance

You hate copy-pasting? you like polymorphism? you like static-typing? Then multiple inheritance is for you.

In Nit, all kind of classes (including interfaces) can provide methods with bodies.
All kind of classes (including concrete classes) can specialize one or more super-class.

### But multiple inheritance is too complex for my mind, isn't it?

In Nit, inheritance (and especially multiple inheritance) is done right:

* No repeated inheritance: inheritance is only based on a principle of specialization. Therefore, a class is either inherited or is not inherited. A Cow is an Animal, there is no point to even ask "how many time a Cow is an Animal?"

* No explicit transitive specialization. If a class already specializes an other class by transitivity, explicitly declaring this class as a super-class has no effect (and a compiler might gives you a warning)

* No hidden inheritance: specialization is public, therefore if you can see the classes, you can see their specialization links.

* No static overloading: A method or an attribute introduced in a super-class is always inherited and cannot be mistaken with something different.

# Class Refinement

Class refinement is the Nit way to do open classes.
The principle is basic: a [[module|#Module]] can refine a class to improve it (the correct world might be "extend" but it could be misinterpreted because of Java).

To refine a class, use the keyword `redef`.

    redef class String
        fun ellipsis(length: Int): String
        do
            if self.length <= length then return self
            return self.substring(0, length) + "..."
        end
    end

    print "hello world!".ellipsis(4) # -> "hell..."

Note that all classes can be refined, even primitive ones because [[everything is an object|#Everything_is_an_Object]].

Once a class is refined, all its instances and all its sub-classes gains the refinement.

Refinement can also be used to:

* redefine an existing method
* add attributes
* add new super-classes

### When should I do refinement and when should I do specialization?

It is a tricky question since the best answer depends on the concrete usecase and problem.
However, there is a good rule of thumb: If you hesitate between refinement and specialization, then it is specialization.

# Virtual Types

Virtual type is a way to define in a class a property that is associated with a type.
This property can be used to type parameters, return of functions, variables, etc.
Virtual types are inherited by subclasses and can be redefined.

Virtual types is a good solution when:

  * A class need to refer to the real itself
  * Two class hierarchy are somewhat parallel
  * You want [[covariance|#Covariant_Typing_Policy]]

### Usage

Example, we have employees what works in standard office and bosses, that are technically employees, but hat works in boss offices (that are improved offices with a fridge).

One way to achieve the modeling is to use virtual types.
virtual types are defined inside class (like methods and attributes) but with the keyword `type`.
Inside the class, the virtual type can be used (almost) like any other static type.

~~~
class Employee
    type OFFICE: Office
    var office: OFFICE
end
class Office
    # ...
end
~~~

Subclasses can redefine (with `redef`) the virtual types they want to change.
The only requirement is that the new bound is a sub-type of the previous bound.

~~~
class Boss
    super Employee
    redef type OFFICE: BossOffice
end
class BossOffice
    super Office
end
~~~

The redefinition of a virtual type is used by the compiler to prevent some type errors.
For example, assuming that boss' offices have a fridge:

~~~nitish
    var e: Employee = ...
    e.office.fridge.open # Compilation Error! Office has no method fridge
    var b: Boss = ...
    b.office.fridge.open # OK!
~~~

# Covariant Typing Policy

Covariance in Nit has two causes:

  * generic types are covariant on the base type: ie `Array[Cat]` is a subtype of `Array[Object]` because `Cat` is a subtype of `Object`. This is not true in most of object-oriented languages.
  * [[virtual types|#Virtual_Types]] can be redefined

### Advantages and drawbacks of the covariance

The main advantage of the covariance is the improved expressiveness to the Nit models.

~~~
class Employee
    type OFFICE: Office
    var office: OFFICE
end

class Boss
    super Employee
    redef type OFFICE: BossOffice
end

var b: Boss = ...
var o: Office = ...
b.office = o # Compilation Error! Expected a BossOffice
~~~

Invariant languages (eg. Java, C++) have to use unsafe downcasts to achieve the same effects.
