#!/usr/bin/env bats

load test_helper

@test "invoking files(1) with -h option prints usage" {
  run files -h
  [ "$status" -eq 1 ]
  [ "${lines[0]}" == "  Usage: files [options] [number-of-files/folders]" ]
}

@test "invoking files(1) with a parameter of '10' generates 10 files" {
  run files 10
  [ "$status" -eq 0 ]
  [ "$(number_of_files '.')" -eq 10 ]
}

@test "invoking files(1) with a parameter of '10 2' generates 10 files and 2 folders" {
  run files 10 2
  [ "$status" -eq 0 ]
  [ "$(number_of_files '.')" -eq 10 ]
  [ "$(number_of_folders)" -eq 2 ]
}

@test "invoking files(1) with a parameter of '10 2 6' generates 10 files whereas 6 files in 2 folders" {
  run files 10 2 6
  [ "$status" -eq 0 ]
  [ "$(number_of_files '.')" -eq 10 ]
  [ "$(number_of_folders)" -eq 2 ]
  [ "$(number_of_files '**/*')" -eq 6 ]
}
