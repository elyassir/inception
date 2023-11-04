#!/bin/bash

output="asd output.txt asd"

if [[ $output == *"output.txt"* ]]; then
    echo "True"
else
    echo "False"
fi