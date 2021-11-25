#!/usr/bin/env bats

@test "Hello does not equal world" {
  [ "hello" != "world" ]
}
