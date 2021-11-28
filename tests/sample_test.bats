#!/usr/bin/env bash

# Source the shellmock functions into the shell.
load "external/bats_shellmock/load.bash"

setup() {
  skipIfNot "$BATS_TEST_DESCRIPTION"
  shellmock_clean
}

teardown() {
  if [ -z "$TEST_FUNCTION" ]; then
    shellmock_clean
  else
    echo Single Test Keeping stubs: "${BATS_TEST_DESCRIPTION}/${TEMP_STUBS}"
  fi
}

@test "sample.sh-success" {

    run "${BATS_TEST_DIRNAME}/sample.sh"

    [ "$status" = "0" ]

    # Validate using lines array.
    [ "${lines[0]}" = "sample found" ]

    # Optionally since this is a single line you can use $output
    [ "$output" = "sample found" ]
}

@test "sample.sh-success-partial-mock" {

    shellmock_expect grep --status 0 --type partial --match '"sample line"'

    run "${BATS_TEST_DIRNAME}/sample.sh"

    shellmock_dump

    [ "$status" = "0" ]

    # Validate using lines array.
    [ "${lines[0]}" = "sample found" ]

    # Optionally since this is a single line you can use $output
    [ "$output" = "sample found" ]

    shellmock_verify
    shellmock_verify_times 1
    shellmock_verify_command 0 'grep-stub "sample line" sample.out'
}
