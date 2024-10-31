#!/bin/bash

ng () {
	echo ${1}行目がちがうよi
	res=1
}

res=0
a=山田
[ "$a" = 上田 ] || ng "$LINENO"
[ "$a" = 山田 ] || ng "$LINENO"
[ "$a" = 霜田 ] || ng "$LINENO"

exit $res
