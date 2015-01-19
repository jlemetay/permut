Permut Vim plugin
=================

Brief
-----

This permut.vim plugin allows to swap two columns of text in a selected range
of lines.  The columns are separated by any character (not present in text).
The character '|' is the column separator by default, but you can choose in
the user-defined Permut command line another separator character such as for
instance ',', ';' or ':'.


Command syntax
--------------

Here is the syntax of the Permut command in normal mode:

    :[range] Permut <colnum1> <colnum2> [separator]



Examples
--------

    Example 1 with default column separator:

    1  ab cd | ef gh | ijk lmn | opq rst | uv wx | yz
    2  ab cd | ef gh | ijk lmn | opq rst | uv wx | yz
    3  ab cd | ef gh | ijk lmn | opq rst | uv wx | yz
    4  ab cd | ef gh | ijk lmn | opq rst | uv wx | yz
    5  ab cd | ef gh | ijk lmn | opq rst | uv wx | yz
    6  ab cd | ef gh | ijk lmn | opq rst | uv wx | yz
    7  ab cd | ef gh | ijk lmn | opq rst | uv wx | yz

    :1,7 Permut 1 3

    1  ijk lmn | ef gh | ab cd | opq rst | uv wx | yz
    2  ijk lmn | ef gh | ab cd | opq rst | uv wx | yz
    3  ijk lmn | ef gh | ab cd | opq rst | uv wx | yz
    4  ijk lmn | ef gh | ab cd | opq rst | uv wx | yz
    5  ijk lmn | ef gh | ab cd | opq rst | uv wx | yz
    6  ijk lmn | ef gh | ab cd | opq rst | uv wx | yz
    7  ijk lmn | ef gh | ab cd | opq rst | uv wx | yz


    Example 2 with some fields undetermined:

    1  ab cd | ef gh | ijk lmn | opq rst | uv wx | yz
    2  ab cd | ef gh | ijk lmn | opq rst | uv wx
    3  ab cd | ef gh | ijk lmn | opq rst
    4  ab cd | ef gh | ijk lmn
    5  ab cd | ef gh | ijk lmn | opq rst
    6  ab cd | ef gh | ijk lmn | opq rst | uv wx
    7  ab cd | ef gh | ijk lmn | opq rst | uv wx | yz

    :1,7 Permut 1 4

Here is below the result without column alignement.

    1  opq rst | ef gh | ijk lmn | ab cd | uv wx | yz
    2  opq rst | ef gh | ijk lmn | ab cd | uv wx
    3  opq rst| ef gh | ijk lmn | ab cd 
    4  ab cd | ef gh | ijk lmn
    5  opq rst| ef gh | ijk lmn | ab cd 
    6  opq rst | ef gh | ijk lmn | ab cd | uv wx
    7  opq rst | ef gh | ijk lmn | ab cd | uv wx | yz

Here is below the result with column alignement.
The alignement of columns is handled by another plugin.
In our case, when the Tabular plugin is installed,
it is used automatically by the Permut plugin to align the columns.

    1  opq rst | ef gh | ijk lmn | ab cd | uv wx | yz
    2  opq rst | ef gh | ijk lmn | ab cd | uv wx
    3  opq rst | ef gh | ijk lmn | ab cd
    4  ab cd   | ef gh | ijk lmn
    5  opq rst | ef gh | ijk lmn | ab cd
    6  opq rst | ef gh | ijk lmn | ab cd | uv wx
    7  opq rst | ef gh | ijk lmn | ab cd | uv wx | yz

Note that the line 4 has not been treated due to
the undetermined cell (4,4).


    Example 3 with another column separator:

    1  ab cd ; ef gh ; ijk lmn ; opq rst ; uv wx ; yz
    2  ab cd ; ef gh ; ijk lmn ; opq rst ; uv wx ; yz
    3  ab cd ; ef gh ; ijk lmn ; opq rst ; uv wx ; yz
    4  ab cd | ef gh | ijk lmn | opq rst | uv wx | yz
    5  ab cd ; ef gh ; ijk lmn ; opq rst ; uv wx ; yz
    6  ab cd ; ef gh ; ijk lmn ; opq rst ; uv wx ; yz
    7  ab cd ; ef gh ; ijk lmn ; opq rst ; uv wx ; yz

    :1,7 Permut 1 5 ;

    1  uv wx ; ef gh ; ijk lmn ; opq rst ; ab cd ; yz
    2  uv wx ; ef gh ; ijk lmn ; opq rst ; ab cd ; yz
    3  uv wx ; ef gh ; ijk lmn ; opq rst ; ab cd ; yz
    4  ab cd | ef gh | ijk lmn | opq rst | uv wx | yz
    5  uv wx ; ef gh ; ijk lmn ; opq rst ; ab cd ; yz
    6  uv wx ; ef gh ; ijk lmn ; opq rst ; ab cd ; yz
    7  uv wx ; ef gh ; ijk lmn ; opq rst ; ab cd ; yz

Note that the line 4 has not been treated due to
the different column separator.


Installation
------------

A simple way to install Permut Vim plugin is to use
[Pathogen](https://github.com/tpope/vim-pathogen).
Once this plugin manager is installed, you have just to
run these commands:

    cd ~/.vim/bundle
    git clone git://github.com/jlemetay/permut.git


Optional dependency
-------------------

The permut.vim plugin does not manage the column alignment, its job is only
to swap columns of text.

If you want automatic column alignment, then install one of the following Vim plugins:
- [Tabular](https://github.com/godlygeek/tabular)
- [vim-easy-align plugin](https://github.com/junegunn/vim-easy-align)


License
-------
Copyright (c) JYLM. Distributed under the same terms as Vim itself. See `:help license`.


