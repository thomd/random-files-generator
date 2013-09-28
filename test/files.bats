#!/usr/bin/env bats

load test_helper

# 1
@test "invoking files(1) with -h option prints usage" {
  run files -h
  [ "$status" -eq 1 ]
  [ "${lines[2]}" == "  Usage: files [options] [number-of-files/folders]" ]
}

# 2
@test "invoking files(1) with no parameter generates a random number of files and folders" {
  run files
  [ "$(number_of_files)" -gt 0 ]
  [ "$(number_of_folders)" -gt 0 ]
}

# 3
@test "invoking files(1) with a parameter of '10' generates 10 files and no folders" {
  run files 10
  [ "$(number_of_files)" -eq 10 ]
  [ "$(number_of_folders)" -eq 0 ]
}

# 4
@test "invoking files(1) with a parameter of '10 2' generates 10 files and 2 folders" {
  run files 10 2
  [ "$(number_of_files)" -eq 10 ]
  [ "$(number_of_folders)" -eq 2 ]
}

# 5
@test "invoking files(1) with a parameter of '1 0' generates 1 file and no folders" {
  run files 1 0
  [ "$(number_of_files)" -eq 1 ]
  [ "$(number_of_folders)" -eq 0 ]
}

# 6
@test "invoking files(1) with a parameter of '10 2 6' generates 10 files of which 6 files are in 2 folders" {
  run files 10 2 6
  [ "$(number_of_files)" -eq 10 ]
  [ "$(number_of_folders)" -eq 2 ]
  [ "$(number_of_files '**/*')" -eq 6 ]
}

# 7
@test "generated files should only contain words from the wordlist" {
  echo "foo" > wordlist.txt
  run files -f wordlist.txt 10
  [ "$(number_of_files '.' 'foo*')" -eq 10 ]
}

# 8
@test "invoking files(1) with '-c' option appends content to existing files" {
  run files 10
  [ "$(number_of_files)" -eq 10 ]
  [ "$(number_of_lines)" -eq 10 ]
  run files -c
  [ "$(number_of_files)" -eq 10 ]
  [ "$(number_of_lines)" -eq 20 ]
}

# 9
@test "invoking files(1) with '-c' option appends sequenced content" {
  run files 1 0
  for i in {1..9}; do run files -c; done
  [ "$(number_of_lines)" -eq 10 ]
  [ "$(cat * | tr -d 0-9 | uniq | wc -l)" -eq 1 ]
}

# 10
@test "generated files should only contain words from a stdin wordlist" {
  run files 10 <<< "foo"
  [ "$(number_of_files '.' 'foo*')" -eq 10 ]
  run $(echo "bar" | files 10)
  [ "$(number_of_files '.' 'bar*')" -eq 10 ]
}

# 11
@test "if wordlist does not exist, use a wordlist with single letters from a to z" {
  export WORDLIST=~/non-existing-wordlist.txt
  run files 1 0
  [ "$(number_of_files '.' '[a-z]')" -eq 1 ]
}

# 12
@test "deleting files should restore initial state" {
  [ "$(number_of_files)" -eq 0 ]
  run files 10
  [ "$(number_of_files)" -eq 10 ]
  run files -d
  [ "$(number_of_files)" -eq 0 ]
}

# 13
@test "starting a new session and deleting afterwards should only delete new files" {
  run files 10
  [ "$(number_of_files)" -eq 10 ]
  run files -s
  run files 10
  run files -d
  [ "$(number_of_files)" -eq 10 ]
}

