# files(1)

`files(1)` is a random files generator for the bash console.

[![Build Status](https://travis-ci.org/thomd/random-files-generator.png)](https://travis-ci.org/thomd/random-files-generator)

Do you need to generate a bunch of random files with random names and
random content? Think about experimenting with [git][1] or testing a [rsync][2] script.

![example of files(1) usage][img1]

`files(1)` uses random words from a wordlist for naming files and
folders. The content of each file is the same as the filename.

Alternatively you can provide words to use as command arguments like so:

    $ files 5 foo bar baz

This generates five files with 'foo', 'bar' and 'baz' as names for the
files and the content.

## Usage

    Usage: files [options] [number ...] [word ...]

    Options:

      -f, --wordfile <file>    Location of a wordfile
      -e, --extension <ext>    Extension of generated files
      -c, --content            Add one line of content to generated files
      -r, --remove             Remove one line of content from generated files
      -d, --delete             Delete all generated files
      -l, --list               List generated files
      -s, --session            Start a new session
      -v, --version            Output version
      -h, --help               This message

Paths of generated files are stored in a simple text file `.files` in
the current directory (you should `echo ".files" >> ~/.gitignore`). 
This list is called a **files session**. All files generated within a 
session can be deleted, listed or added with more content.

Out-of-the-box `files(1)` uses the standard OSX wordlist
`/usr/share/dict/words`. If this wordlist does not exist and no words are 
explicitly given as command arguments, `files(1)` uses bare letters for 
naming files and folders.

You may provide an own wordlist via an environment variable `WORDLIST`

    $ export WORDLIST=~/.my_wordlist

or provide words via STDIN:

    $ cat wordlist.txt | xargs files 10

The three numerical key parameter for generating files are in this
order:

* number of files
* number of folders
* number of files to be moved into this folders

All three parameter are optional (see Examples).

## Examples

### Generating new files

Generate a random number of files and folders:

    $ files

Generate a random number of files and folders using the words 'foo', 'bar' & 'baz':

    $ files foo bar baz

Generate 10 files in current directory:

    $ files 10

Generate 10 files of which a random number of them are moved into 2 folders:

    $ files 10 2

Generate 10 files of which 6 files are randomly moved into 2 folders:

    $ files 10 2 6

Generate 10 files using the words 'foo', 'bar' & 'baz':

    $ files 10 foo bar baz

Generate 10 files with extension 'txt' using the words 'foo', 'bar' & 'baz':

    $ files 10 -e txt foo bar baz

Generate files and folders using words from `mywords.txt`:

    $ files -f mywords.txt
    $ cat mywords.txt | xargs files

### Manipulation of generated files

Append one line of random content to all generated files of a session:

    $ files -c

Append six lines of random content to all generated files of a session:

    $ files -6c

Remove last line of content of all generated files of a session:

    $ files -r

Append last six lines of content of all generated files of a session:

    $ files -6r

Delete all generated files of a session:

    $ files -d

Start a new session (if no session exist, a new one is created):

    $ files -s

## Help

Find help on man page via `man files` or check usage info via `files -h`.

## Installation

Use `Makefile` for installation. First run tests, then install binary
and man page. Binary is installed into `/usr/local/bin`.
Install the bash testing framework [bats][3] before running the tests.

    make test
    make install                              # installs binary and man page

Tests are green on OSX and Debian Linux (using [Vagrant][4]).

You may also install binary and man page into your home directory using 
the `DESTDIR` environment variable:

    mkdir -p ~/bin ~/share/man
    export PATH=~/bin:$PATH
    unset MANPATH && export MANPATH=~/share/man:$(manpath)
    make DESTDIR=~ install

For faster typing of the `files` command (at least for me), you might set a alias in your `~/.bashrc`:

    alias fls=files

## License

© 2013 Thomas Duerr. files(1) is released under an MIT-style license

[1]: http://git-scm.com/
[2]: http://man.cx/rsync(1)
[3]: https://github.com/sstephenson/bats
[img1]: https://raw.github.com/thomd/random-files-generator/images/files.png
[4]: http://docs.vagrantup.com/v2/
