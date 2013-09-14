# files(1) - a random files generator

## SYNOPSIS

**files** [**-vh**] [**-f** _wordfile_] [*num_files*] [*num_folders*] [*num_files_in_folders*]  
**files** **-c**

## DESCRIPTION

generate random files and folders for testing or experimenting.

`files` uses random words from a wordlist for naming files and folders. The content of each file
is the same as the filename. Out-of-the-box `files` uses the standard OSX wordlist _/usr/share/dict/words_.
If this wordlist does not exist, `files` uses letters for naming files and folders. You may also 
provide an own wordlist via an environment variable WORDLIST or the **-f** option.

## OPTIONS
**-f**, **--wordfile**
    Location of a wordfile

**-c**, **--content**
    Add Content to existing files

**-v**, **--version**
    Output version

**-h**, **--help**
    Help message

## ENVIRONMENT VARIABLES
WORDLIST specifies an own wordlist. Default is _/usr/share/dict/words_

## EXAMPLES

Generate a random number of files and folders:

      files

Generate 10 files, a random number of them in folders:

      files 10

Generate 10 files only (no folders):

      files 10 0

Generate 10 files of which 6 files are in 2 folders:

      files 10 2 6

Append furher content to all files in current working directory:

      files -c

Generate files and folders using words from _mywords.txt_:

      files -f mywords.txt  
      cat mywords.txt | files                      # using STDIN

Generate 10 files using a single word "foo":

      files 10 <<< "foo"  
      echo -e "foo" | files 10                     # using STDIN

## AUTHOR
Thomas Duerr (thomduerr@gmail.com)

## GITHUB
http://github.com/thomd/random-files-generator
