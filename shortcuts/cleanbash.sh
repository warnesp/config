#!/bin/bash
#remove any line that contains the word 'password' (ignoring case)
ex "+set ignorecase" +g/password/d -cwq ~/.bash_history

