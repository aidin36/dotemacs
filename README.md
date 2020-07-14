What is it?
-----------
This is my [Emacs](https://www.gnu.org/software/emacs/) configurations. This lives in `~/.emacs.d/` directory on my machines.

I use Emacs for developing Scala, Go, and Python, among every other text file on my machine.

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
* `Adobe Source Code Pro` font.
* fd (https://github.com/sharkdp/fd)

Scala:
* `scalafmt` for formatting scala files.

Go:
* gofmt for formatting go files.
* gocode (go get -u github.com/nsf/gocode) for auto completion.
* godef (go get -u github.com/rogpeppe/godef) for jumping around go code.

Python:
* jedi (pip install jedi) for autocompletion.
* autopep8 (pip install autopep8) for formatting Pythong files.

Rust:
* rustfmt (cargo install rustfmt) for code formatting.
* Rust source code (rustup component add rust-src) for code completion.
* racer (cargo install racer) for autocompletion.

Javascript:
* ESLint. It needs to be installed globally (npm install eslint --global) but there should be a local config file.
* Prettier for formatting. It can be installed in the project's packages (npm install prettier)

Other:
* z (https://github.com/rupa/z/) for jumping to directories quickly.
* yamllint (pip install yamllint)

Copyright
---------
Copyright 2018-2020 Aidin Gharibnavaz (https://aidinhut.com)
All of these files are free software and published under the terms of GNU General Public License version 3 (or at your opinion, any later version).
See [GNU General Public License](https://www.gnu.org/licenses/gpl-3.0.en.html) for more information.