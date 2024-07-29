#!/bin/bash
unit_tests=$(grep -rlE 'fdescribe\(|fit\(' src)
ui_tests=$(grep -rlE 'describe.only\(|it.only\(' cypress)

if [ "$unit_tests" ] || [ "$ui_tests" ]; then
  echo "Found ignored tests, failing: $unit_tests $ui_tests"
  exit 1
else
  echo "No ignored tests found."
  exit 0
fi
