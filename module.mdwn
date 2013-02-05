# Module

In Nit, a program consists of a collection of modules.
A module in Nit serves the following purposes:

  * grouping classes and methods related to a single concern
  * controlling visibility and name-spaces
  * controlling [[refinement]] of classes

Modules are connected by importation links (with the keyword `import`) and a Nit program is simply a module that imports all the other modules.

Note that the importation between modules cannot be circular.

By default, the module `standard` is imported by every modules.
It contains some basic classes and methods usually expected by the developers.
