#!/bin/bash

#$HOME/eclipse/java-2021-12/eclipse/eclipse
#$HOME/eclipse/java-2022-03/eclipse/eclipse

#looks in the home directory for eclispe installs, run the newest

 $(find "$HOME/eclipse/" -name eclipse -executable -type f | sort -r | head -n 1)

