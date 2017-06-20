# Repository of Android Applications

Android users can use the <http://fdroid.org> client, add the official Nit-Droid repository and benefit experimental and bleeding-edge state of the art of mobile Nit applications.

0. Download and install the [F-Droid client](https://f-droid.org/FDroid.apk)
1. Manage repository (in the menu)
2. Add a repository (plus icon)
3. Enter the address <http://nitlanguage.org/fdroid>
4. Update (update icon)

Note: A new F-Droid category `Nit` contains all the applications.

The source code of the applications in the F-Droid repository is available in the catalog under the [apk tag](http://nitlanguage.org/catalog/index.html#tag_apk).

These applications are compiled by the Nit tools thanks to the [[app.nit support|/FFI/Nit_on_Android]].

Note: if, for some reason, the fdroid client is not functional, there is the raw [list of downloadable `.apk` files](list.html).

## How to publish on nitdroid?

This section is indented to maintainers and developpers that wish to publish on nitdroid.

In order to publish the apk, you need:

* A `android-release` target in the main `Makefile`.
  The target must compile with the nitc options `-m android` and `--release`
* [F-Droid metadata](https://f-droid.org/manual/html_node/Metadata.html) files in the main directory.
  They are named as the apk ID with ’.txt’ appended (e.g. `org.nitlanguage.calculator.txt`).
* Optionnally, a `upstream.apk` entry in the `package.ini` file that points to `http://nitlanguage.org/fdroid/apk/XXX.apk`. Where `XXX` is the last element of the apk ID (e.g. `calculator.apk` for `org.nitlanguage.calculator`)

See the [calculator example](https://github.com/nitlang/nit/tree/master/examples/calculator).
