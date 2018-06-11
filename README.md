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
* xclip

Scala:
* scalafmt

Go:
* gofmt
* gocode (go get -u github.com/nsf/gocode)

Python:
* jedi (pip install jedi)
* autopep8 (pip install autopep8)

Copyright
---------
Copyright 2018 Aidin Gharibnavaz (https://aidinhut.com)
All of these files are free software and published under the terms of GNU General Public License version 3 (or at your opinion, any later version).
See [GNU General Public License](https://www.gnu.org/licenses/gpl-3.0.en.html) for more information.