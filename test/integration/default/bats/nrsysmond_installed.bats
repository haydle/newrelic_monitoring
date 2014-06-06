#!/usr/bin/env bats

@test "nrsysmond is found in PATH" {
  run which nrsysmond
  [ "$status" -eq 0 ]
}
