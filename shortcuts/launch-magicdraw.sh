#!/bin/bash

exec "$(find $HOME -name "magicdraw" -executable -type f | head -n 1)"

