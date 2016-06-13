#!/bin/bash
name=$1
pos="${name%%:*:*}"
if [[ $pos == $name ]]; then
    pos="${name%%:*}"
    if [[ $pos == $name ]]; then
        ln=
        file=$name
    else
        ln=+${name##*:}
        file=$pos
    fi
else
    ln=+${name#*:}
    echo ln: $ln
    ln=${ln%%:*}
    echo ln: $ln
    file=$pos
fi

vi -R $ln $file
