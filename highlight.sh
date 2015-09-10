#!/bin/sh

# meta is the argument
meta=$1

# raw is noting
test "$meta" = "raw" && exit 0

# nitish is nit
test "$meta" = "nitish" && meta=nit

# if `pandoc` then process through the `pandoc` command.
if test "$meta" = "pandoc"; then
	exec pandoc -t html
fi

# Else use `highlight`
exec highlight --fragment -S "$meta" --enclose-pre
