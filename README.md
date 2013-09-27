# files(1)

`files(1)` is a random files generator for the bash console.

Do you need to generate a bunch of random files with random names and
random content? Think about experimenting with [git][1] or testing a [rsync][2] script.

![example of files(1) usage][img1]

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

    $ export WORDLIST=~/.my_wordlist

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

Generate 10 files with a random number of them in a random number of folders:

    $ files 10

Generate 10 files and 2 folders with a random number of them in these
two folders:

    $ files 10 2

Generate 10 files and no folders:

    $ files 10 0

Generate 10 files of which 6 files are in 2 folders:

    $ files 10 2 6

Append further content to all files in current working directory:

    $ files -c

Generate files and folders using words from `mywords.txt`:

    $ files -f mywords.txt
    $ cat mywords.txt | files                       # read words from stdin

Generate 10 files using a single word "foo":

    $ files 10 <<< "foo"                            # read words from stdin using a here-string
    $ echo -e "foo" | files 10                      # read words from stdin

## Installation

Use `Makefile` for installation. First run tests, then install binary
and man page. Please install the bash testing framework [bats][3] before
running the tests.

    make test
    sudo make install                              # installs binary and man page

Without `sudo` privileges, you may install binary and man page into your home directory using 
the `DESTDIR` environment variable:

    mkdir ~/bin ~/share/man
    export PATH=~/bin:$PATH
    unset MANPATH && export MANPATH=~/share/man:$(manpath)
    
    make DESTDIR=~ install

Tests are green on OSX and Ubuntu (via Vagrants lucid32 box).

## Help

Find help on man page via `man files` or check usage-info via `files -h`.

## License

© 2013 Thomas Duerr. files(1) is released under an MIT-style license

[1]: http://git-scm.com/
[2]: http://man.cx/rsync(1)
[3]: https://github.com/sstephenson/bats
[img1]: https://raw.github.com/thomd/random-files-generator/images/files.png
