# How can I redefine the `+=` operator ?

You can't.

`x.foo += 5` is in fact syntaxic sugar `to x.foo = x.foo + 5` where `x` is evaluated only once.

Since `x.foo = bar` corresponds to the call of the foo getter method `foo=()` and `x.foo + bar` corresponds to the `+()` method call on `x`, both these behaviors can be redefined by refinment.
