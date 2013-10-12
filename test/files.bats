#!/usr/bin/env bats

load test_helper

# 1
@test "invoking 'files -h' should print usage info" {
  run files -h
  [ "$status" -eq 1 ]
  [ "${lines[2]}" == "  Usage: files [options] [number-of-files/folders]" ]
}

# 2
@test "invoking 'files' should generate a random number of files and folders" {
  run files
  [ "$(number_of_files)" -gt 0 ]
  [ "$(number_of_folders)" -gt 0 ]
}

# 3
@test "invoking 'files 10' should generate 10 files and no folders" {
  run files 10
  [ "$(number_of_files)" -eq 10 ]
  [ "$(number_of_folders)" -eq 0 ]
}

# 4
@test "invoking 'files 10 2' should generate 10 files and 2 folders" {
  run files 10 2
  [ "$(number_of_files)" -eq 10 ]
  [ "$(number_of_folders)" -eq 2 ]
}

# 5
@test "invoking 'files 10 0' should generate 10 files and no folders" {
  run files 10 0
  [ "$(number_of_files)" -eq 10 ]
  [ "$(number_of_folders)" -eq 0 ]
}

# 6
@test "invoking 'files 10 2 6' should generate 10 files whereas 6 files are in 2 folders" {
  run files 10 2 6
  [ "$(number_of_files)" -eq 10 ]
  [ "$(number_of_folders)" -eq 2 ]
  [ "$(number_of_files '**/*')" -eq 6 ]
}

# 7
@test "invoking 'files -f wordlist' should generate files with filenames from the wordlist" {
  echo "foo" > wordlist.txt
  run files -f wordlist.txt 10
  [ "$(number_of_files '.' 'foo*')" -eq 10 ]
}

# 8
@test "invoking 'files -c' should append content to existing files" {
  run files 10
  [ "$(number_of_files)" -eq 10 ]
  [ "$(number_of_lines)" -eq 10 ]
  run files -c
  [ "$(number_of_files)" -eq 10 ]
  [ "$(number_of_lines)" -eq 20 ]
}

# 9
@test "invoking 'files -c' should append one line of sequenced content" {
  run files 1
  for i in {1..9}; do run files -c; done
  [ "$(number_of_lines)" -eq 10 ]
  [ "$(cat * | tr -d 0-9 | uniq | wc -l)" -eq 1 ]
}

# 10
@test "invoking 'files -3c' should append 3 lines of sequenced content" {
  run files 1
  run files -3c
  [ "$(number_of_lines)" -eq 4 ]
  [ "$(cat * | tr -d 0-9 | uniq | wc -l)" -eq 1 ]
}

# 11
@test "invoking 'files -r' should remove last line of content" {
  run files 1
  run files -c
  [ "$(number_of_lines)" -eq 2 ]
  run files -r
  [ "$(number_of_lines)" -eq 1 ]
}

# 12
@test "invoking 'files -3r' should remove 3 lines of content" {
  run files 1
  run files -3c
  [ "$(number_of_lines)" -eq 4 ]
  run files -3r
  [ "$(number_of_lines)" -eq 1 ]
}

# 13
@test "invoking 'files -d' should delete all generated files from within a session" {
  [ "$(number_of_files)" -eq 0 ]
  run files 10
  [ "$(number_of_files)" -eq 10 ]
  run files -d
  [ "$(number_of_files)" -eq 0 ]
}

# 14
@test "reading words from stdin should generate files with these words" {
  for w in foo bar baz; do echo $w >> wordlist; done
  run $(cat wordlist | xargs files 10)
  [ "$(( $(number_of_files '.' 'foo*') + $(number_of_files '.' 'bar*') + $(number_of_files '.' 'baz*') ))" -eq 10 ]
}

# 15
@test "if a wordlist does not exist, use single letters from a-z as words" {
  export WORDLIST=~/non-existing-wordlist.txt
  run files 1 0
  [ "$(number_of_files '.' '[a-z]')" -eq 1 ]
}

# 16
@test "invoking 'files foo bar baz' should generate files with names 'foo', 'bar' & 'baz'" {
  run files 10 foo bar baz
  [ "$(( $(number_of_files '.' 'foo*') + $(number_of_files '.' 'bar*') + $(number_of_files '.' 'baz*') ))" -eq 10 ]
}

# 17
@test "invoking 'files -s' should start a new session" {
  run files 10
  [ "$(number_of_files)" -eq 10 ]
  run files -s
  run files 10
  run files -d
  [ "$(number_of_files)" -eq 10 ]
}

# 18
@test "invoking 'files -l' should list all generated files" {
  run files 5
  run files 5
  run files -l
  [ "${#lines[@]}" -eq 10 ]
}

# 19
@test "words should be sanitized" {
  run files 1 "F2oo_B'a.r"
  [ "$(number_of_files '.' 'foo-bar')" -eq 1 ]
  echo "foo bar" > wordlist.txt
  run files -f wordlist.txt 1
  [ "$(number_of_files '.' 'foo-bar')" -eq 1 ]
}

