# How to iterate through an array (and other things)

The `for` construction is used to iterate on many structures.
Thus, the simplest way to iterate through an `Array` is to use it.

~~~
var a = [1, 2, 3]
for i in a do
    print i * 2
end
# outputs 2 4 6
~~~

If the index is needed, a alternative is to iterate on the range of the indexes.

~~~
var b = ["a", "b", "c"]
for i in [0..b.length[ do
    print "{i}:{b[i]}"
end
# outputs 0:a 1:b 2:c
~~~

In fact, all the subclasses for `Collection` can be iterated with the `for` control structure.

~~~
var l = new List[Int]
l.push(20)
l.push(30)
l.unshift(10)
for x in l do print x+2
# outputs 12 22 32
~~~

`Map`s are not `Collection`s but they can also be iterated with the `for` control structure.
In this case two variables are required, one for the key and one for the index.

~~~
var mymap = new HashMap[String, Int]
mymap["one"] = 1
mymap["two"] = 2
mymap["three"] = 3
for k, v in mymap do print "{k}={v}"
# outputs one=1 two=2 three=3
~~~

If only the keys or the values are needed, the two views `keys` and `values` of `Map`s can be used.
These two views implements the `Collection` interface.

~~~
for x in mymap.keys do print x
# outputs one two three
for x in mymap.values do print x
# outputs 1 2 3
~~~

The `for` structure can be used on all collections and all classes that provide an `iterate` method.
