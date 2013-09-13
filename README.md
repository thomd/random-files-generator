# files(1)

`files(1)` is a dummy files generator.

Think about learning [git][1] and need some dummy files or testing a [rsync][2] script with some dummy files.

## Usage

    Usage: files [options] [number-of-files/folders]
    
    Options:
    
      -f, --wordfile   Location of a wordfile
      -c, --content    Add Content to existing files
      -v, --version    Output version
      -h, --help       This message

`files(1)` uses random words from a wordlist for naming files and
folders. The content of each file is the same a the filename.

Out-of-the-box `files(1)` uses the standard OSX wordlist
`/usr/share/dict/words`. If this wordlist does not exist, `files(1)` uses
letters for naming files and folders.

You may provide a own wordlist via

    $ echo -e "foo
    $ bar
    $ baz" > ~/.my_own_private_wordlist
    $ export WORDLIST=~/.my_own_private_wordlist

or provide words via STDIN:

    $ files 10 <<< "foo"

The three key parameter for generating files are

* number of files
* number of folders
* number of files to be moved into these folders

All three parameter are optional.

## Examples

generate a random number of files and folders:

    $ files

generate 10 files, some of them in folders:

    $ files 10

generate 10 files only:

    $ files 10 0

generate 10 files of which 6 files are in 2 folders:

    $ files 10 2 6

append furher content to all files in current working directory:

    $ files -c

generate files and folders using words from `mywords.txt`:

    $ files -f mywords.txt
    $ cat mywords.txt | files                      # using STDIN

generate 10 files using a single word "foo":

    $ files 10 <<< "foo"
    $ echo -e "foo" | files 10                     # using STDIN

## Installation

    make install

## Testing

    make test

Tesitng framework is [bats][3].

## Help

    man files

or

    files -h

[1]: http://git-scm.com/
[2]: http://man.cx/rsync(1)
[3]: https://github.com/sstephenson/bats
