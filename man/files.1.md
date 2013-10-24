# files(1) - a random files generator

## SYNOPSIS

**files** [**-f** _wordfile_] [**-e** _extension_] [*number* ...] [*word* ...]  
**files** [**-vhcdrls**]

## DESCRIPTION

generate random files and folders for testing or experimenting.

`files` uses random words from a wordlist for naming files and folders. The content of each file
is the same as the filename. Out-of-the-box `files` uses the standard OSX wordlist _/usr/share/dict/words_.
If this wordlist does not exist, `files` uses bare letters for naming files and folders. You may also 
provide an own wordlist via an environment variable WORDLIST or the **-f** option.

Metadata of generated files are stored in a simple text file `.files` in the current working directory.
This is called a _session_. All files generated within a _session_ can be deleted, listed or manipulated.

`files` can have up to three optional _numbers_ as arguments in this
given order:  
1) number of generated files  
2) number of generated folders (defaults to zero if not given)  
3) number of files to be moved inside the folders (hence can't be higher than number of files)

## OPTIONS
**-f**, **--wordfile**
    Location of a wordfile

**-e**, **--extension**
    Extension of generated files

**-c**, **--content**
    Add one line of ontent to existing files. Prefix short option with a number for adding multiple lines. 
    Example: **-6c** adds six lines of content.

**-r**, **--remove**
    Remove last line of ontent from existing files. Prefix short option with a number for removing multiple lines. 
    Example: **-6r** removes six lines of content.

**-d**, **--delete**
    Delete all generated files of a _session_

**-l**, **--list**
    List all generated files of a _session_

**-s**, **--session**
    Start a new _session_ (if no session exist, a new one is created).

**-v**, **--version**
    Output version

**-h**, **--help**
    Help message

## ENVIRONMENT VARIABLES
WORDLIST specifies an own wordlist. Default is _/usr/share/dict/words_

## EXAMPLES
Generate a random number of files and folders:

      files

Generate 10 files:

      files 10

Generate (zero files and) 10 folders:

      files 0 10

Generate 10 files inside 2 folders:

      files 10 2 10

Generate 10 files using the words 'foo', 'bar' and 'baz':

      files 10 foo bar baz

Append content to all generated files:

      files -c

Delete all generated files:

      files -d

Generate files and folders using words from _mywords.txt_:

      files -f mywords.txt
      cat mywords.txt | xargs files               # alternatively using STDIN

## AUTHOR
**Thomas Duerr** (thomduerr@gmail.com)

## GITHUB
http://github.com/thomd/random-files-generator
