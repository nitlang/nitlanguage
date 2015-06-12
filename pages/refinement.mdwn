# Class Refinement

Class refinement is the Nit way to do open classes.
The principle is basic: a [[module]] can refine a class to improve it (the correct world might be "extend" but it could be misinterpreted because of Java).

To refine a class, use the keyword `redef`.

    redef class String
        fun ellipsis(length: Int): String
        do
            if self.length <= length then return self
            return self.substring(0, length) + "..."
        end
    end

    print "hello world!".ellipsis(4) # -> "hell..."

Note that all classes can be refined, even primitive ones because [[everything is an object]].

Once a class is refined, all its instances and all its sub-classes gains the refinement.

Refinement can also be used to:

* redefine an existing method
* add attributes
* add new super-classes

### When should I do refinement and when should I do specialization?

It is a tricky question since the best answer depends on the concrete usecase and problem.
However, there is a good rule of thumb: If you hesitate between refinement and specialization, then it is specialization.
