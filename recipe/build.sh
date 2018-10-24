#!/bin/bash

if [[ -z `which c++` ]]
then
    alias c++=x86_64-conda_cos6-linux-gnu-c++
fi

${PYTHON} -m pip install . --no-deps --ignore-installed --no-cache-dir -vvv
