#!/bin/bash
if [ -d /opt/rh/gcc-toolset-10/ ]; then
    scl enable gcc-toolset-10 bash
else
    scl enable devtoolset-10 git19 bash
fi

