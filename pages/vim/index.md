# Nit for Vim

Nit comes with a support for the editor [[vim|http://www.vim.org/]] in the directory [[misc/vim|https://github.com/nitlang/nit/tree/HEAD/misc/vim]].

<div style="text-align:center">
<img src="screenshot.png" title="screenshot" alt="Preview of the Nit bundde for vim"/>
</div>

The support features:

 * syntax highlighting
 * indentation
 * syntax checker (require [[Syntastic|https://github.com/scrooloose/syntastic]]).

## How to install

### Pathogen

Both Nit and Syntastic rely on pathogen.

Install [[pathogen|https://github.com/tpope/vim-pathogen]] with

~~~sh
$ mkdir -p ~/.vim/autoload ~/.vim/bundle
$ curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
~~~

Modify you `.virmrc` to activate pathogen

~~~vim
call pathogen#infect()
~~~

If you're brand new to Vim and lacking a `.vimrc`, `vim ~/.vimrc` and paste in the following super-minimal example:

~~~vim
call pathogen#infect()
syntax on
filetype plugin indent on
~~~

### Nit support

Install the Nit support bundle in vim with

~~~sh
$ cd ~/.vim/bundle
$ ln -s /full/path/to/nit/misc/vim nit
~~~

Note: replace `/full/path/to/nit` with the real path.

Now you should have syntax highlighting and indentation on `.nit` files.

### Syntax checker with Syntastic

Install the [[Syntastic|https://github.com/scrooloose/syntastic]] bundle with

~~~sh
$ cd ~/.vim/bundle
$ git clone https://github.com/scrooloose/syntastic.git
~~~

Add the following line to your `~/.vimrc`

~~~vim
let g:syntastic_nit_checkers = ['nitpick']
~~~

Check that your `$PATH` contains `nitpick`.
If not, the simplest way is add the `bin` directory in your PATH.

Now you should have syntax checking on saving `.nit` files.
