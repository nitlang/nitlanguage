# Is there some `friend` or `package` visibility?

Short answer: use `private`.

Long answer:

It is often useful with strongly coupled classes that one can access some private fields and method of the other.

In Nit, strongly coupled classes should belong to a same module.
Moreover, in Nit the visibility is controlled by module, not classes. Therefore `private` things declared in a module are visible everywhere in the module (but remain invisible in other modules).
