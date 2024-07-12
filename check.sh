#!/bin/bash

MASTER="ALU.circ"
TRUTH="expected-output.txt"
OUTPUT="real-output.txt"
RUN_TEST="logisim-evolution --toplevel-circuit "checker" -tty table"

echo "RUN_TEST: ${RUN_TEST}"
echo "OUTPUT: ${OUTPUT}"

${RUN_TEST} ${MASTER} > "${OUTPUT}"

if [ ! -f "${OUTPUT}" ]; then
    echo "ERROR: Output file could not be created"
    exit 1
fi

if diff -q "${OUTPUT}" "${TRUTH}"; then
    echo "OK"
    exit 0
else
    echo "ERROR: Outputs aren´t equal"
    diff -y --suppress-common-lines "${OUTPUT}" "${TRUTH}"
    exit 1
fi
``` 