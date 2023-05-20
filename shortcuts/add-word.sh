#!/bin/bash


# run with a list of words to add to dictionary

if command -v aspell &> /dev/null
then
    for word in "$@" 
    do
        echo -e "*${word}\n#" | aspell -a
    done

else
    echo "aspell is not installed"
fi
