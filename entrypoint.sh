#!/usr/bin/env bash

if [[ ! -z "${DELAY_START:-}" ]]; then
    echo Waiting for ${DELAY_START} before starting the replication process
    sleep ${DELAY_START}
fi

echo Starting litestream
/usr/local/bin/litestream "$@"
