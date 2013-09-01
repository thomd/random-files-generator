# files(1)

`files(1)` is lorem ipsum for files.

Need some dummy files for testing things out in bash?

Think about learning [git][1] and need some dummy files or testing a [rsync][2] script.

## Usage

The three key parameter for generating files are

* number of files
* number of folders which contains these files
* number of files to put into these folders (defaults to 50%)

## Examples

Generate 20 files in current working directory:

    files 20
    files -f 20

Generate 20 files and 2 folders. Put **half of the files** into the 2
folders:

    files 20 2
    files -f 20 -d 2

generate 20 files and 5 folders. Put 15 files equally into the 5
folders (hence 5 files remain in the current directory):

    files 20 5 15
    files -f 20 -d 5 -p 15

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
[2]: http://man.cx/rsync(1)
