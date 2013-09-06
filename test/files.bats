#!/usr/bin/env bats

load test_helper

@test "invoking files(1) with -h option prints usage" {
  run files -h
  [ "$status" -eq 1 ]
  [ "${lines[0]}" == "  Usage: files [options] [number-of-files]" ]
}

@test "invoking files(1) with a parameter of '10' generates 10 files" {
  run files 10
  [ "$status" -eq 0 ]
  [ "$(number_of_files)" -eq 10 ]
}

@test "invoking files(1) with a parameter of '10 5' generates 10 files and 5 folders" {
  run files 10 5
  [ "$status" -eq 0 ]
  [ "$(number_of_files)" -eq 10 ]
  [ "$(number_of_folders)" -eq 5 ]
}
