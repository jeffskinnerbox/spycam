#!/bin/bash


# kill all the processes associated with the spycam
kill $( awk '{ print $2 }' ~/src/spycam/spycam.pid | tr '\n' ' ' )
