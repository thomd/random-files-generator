# files(1)

`files(1)` is a random files generator for the console.

Think about experimenting with [git][1] and need some dummy files or testing a [rsync][2] script with some dummy files.

## Usage

    Usage: files [options] [number-of-files/folders]

    Options:

      -f, --wordfile   Location of a wordfile
      -c, --content    Add Content to existing files
      -v, --version    Output version
      -h, --help       This message

`files(1)` uses random words from a wordlist for naming files and
folders. The content of each file is the same as the filename.

Out-of-the-box `files(1)` uses the standard OSX wordlist
`/usr/share/dict/words`. If this wordlist does not exist, `files(1)` uses
letters for naming files and folders.

You may provide an own wordlist via an environment variable `WORDLIST`

    $ export WORDLIST=~/.my_own_private_wordlist

or provide words via STDIN:

    $ cat wordlist.txt | files 10

The three key parameter for generating files are

* number of files
* number of folders
* number of files to be moved into the folders

All three parameter are optional (see Examples).

## Examples

Generate a random number of files and folders:

    $ files

Generate 10 files, a random number of them in folders:

    $ files 10

Generate 10 files only (no folders):

    $ files 10 0

Generate 10 files of which 6 files are in 2 folders:

    $ files 10 2 6

Append further content to all files in current working directory:

    $ files -c

Generate files and folders using words from `mywords.txt`:

    $ files -f mywords.txt
    $ cat mywords.txt | files                      # using STDIN

Generate 10 files using a single word "foo":

    $ files 10 <<< "foo"
    $ echo -e "foo" | files 10                     # using STDIN

## Installation

First run tests, then install shell script and man page:

    make test
    make install

You need the bash testing framework [bats][3] installed.

## Help

Find help on man page via `man files` or check usage-info via `files -h`.

## License

© 2013 Thomas Duerr. files(1) is released under an MIT-style license

[1]: http://git-scm.com/
[2]: http://man.cx/rsync(1)
[3]: https://github.com/sstephenson/bats
