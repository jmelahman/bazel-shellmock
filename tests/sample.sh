#!/usr/bin/env bash
echo "sample line" > sample.out

grep "sample line" sample.out > /dev/null
if [ $? -ne 0 ]; then
    echo "sample not found"
    exit 1
fi

echo "sample found"
