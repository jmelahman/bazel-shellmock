#!/usr/bin/env bash
#
# Copied directly from https://github.com/duanemay/bats-shellmock/blob/master/README.md

# Source the shellmock functions into the shell.
. '../bazel-bazel-shellmock/external/bats_shellmock/shellmock.bash' > /dev/null 2>&1 || \
  . 'external/bats_shellmock/shellmock.bash'

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

@test "sample.sh-success-partial-mock" {
  shellmock_expect grep --status 0 --type partial --match '"sample line"'

  run ./sample.sh

  shellmock_dump

  [ "$status" -eq 0 ]
  [ "$output" = "sample found" ]

  shellmock_verify
  shellmock_verify_times 1
  shellmock_verify_command 0 'grep-stub "sample line" sample.out'
}
