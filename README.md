What is it?
-----------
This is my [Emacs](https://www.gnu.org/software/emacs/) configurations. This lives in `~/.emacs.d/` directory on my machines.

I use Emacs as my main editor for everything. From development to task management to editing configs.

How should I use it?
--------------------
Look at my configs. See what you like, and copy that to your own configs. I tried to write comments around the code, so you can easily find your way around.

Evil mode?
----------
If you joined the Darkside, leave here immediately, or draw your lightsaber!

Requirements
------------
The `init.el` file handles all Emacs package dependencies by itself. However, there are some external tools required for some functionality.

General:
* `xclip` for sharing Emacs' kill ring with OS clipboard.
* `Adobe Source Code Pro` font (`Source Code Variable` family).
* fd (https://github.com/sharkdp/fd)
* silver searcher (ag) https://github.com/ggreer/the_silver_searcher
* z (https://github.com/rupa/z/) for jumping to directories quickly.

Scala:
* `scalafmt` for formatting scala files.
* Metals (https://scalameta.org/metals/) (the binary name should be `metals`).

Go:
* gofmt for formatting go files.
* gocode (`go get -u github.com/nsf/gocode`) for auto completion.
* godef (`go get -u github.com/rogpeppe/godef`) for jumping around go code.

Python:
* jedi (`pip install jedi`) for autocompletion.
* autopep8 (`pip install autopep8`) for formatting Pythong files.

Rust:
* rustfmt (`cargo install rustfmt`) for code formatting.
* Rust source code (`rustup component add rust-src`) for code completion.
* racer (`cargo install racer`) for autocompletion.

Javascript/Typescript:
* langserver (`npm install -g typescript-language-server typescript`)
* Prettier for formatting. It can be installed in the project's packages (`npm install prettier`)

Other:
* yamllint (`pip install yamllint` or from your OS package manager.)
* docker language server (`npm install -g dockerfile-language-server-nodejs`)
* shellcheck (`sudo apt-get install shellcheck`)

Copyright
---------
Copyright 2018-2024 Aidin Gharibnavaz (https://aidinhut.com)
All of these files are free software and published under the terms of GNU General Public License version 3 (or at your opinion, any later version).
See [GNU General Public License](https://www.gnu.org/licenses/gpl-3.0.en.html) for more information.
