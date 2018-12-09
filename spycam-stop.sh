#!/bin/bash
#
# Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
# Version:      0.1.0
#
# DESCRIPTION:
#
# NOTE:



# kill all the processes associated with the spycam
kill $( awk '{ print $2 }' ~/src/spycam/spycam.pid | tr '\n' ' ' )
