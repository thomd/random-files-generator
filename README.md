# files(1)

`files(1)` is lorem ipsum for files. 

Need some dummy files for testing things out in bash? Think about learning 
[git][1] and need some dummy files or testing a [rsync][2] script.

## Usage

Generate 10 files in current directory:

    files -f 10

Generate a random number of files between 10 and 20 in current
directory:

    files 10..20
    files -f 10..20

Generate 100 files randomly distributed in folders of max depth of 2:

    files 100 2
    files -f 100 -d 2

Instead of generating new files, append new content to all files within
the current directory and sub-directories (be aware thst this affects
ALL files, even non-generated files):

    files -c

## Installation

    make install

## Help

    man files

or

    files -h

[1]: http://git-scm.com/
[2]: http://man.cx/rsync%281%29
