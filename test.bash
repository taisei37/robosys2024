#!/bin/bash -xv
#!/usr/bin/python3
#SPSX-FileCopyrightText: 2024 Taisei Suzuki
# SPDX-License-Identifier: BSD-3-Clause
ng () {
	echo ${1}行目がちがうよ
	res=1
}

res=0

out=$(seq 5 | ./plus)
++ seq 5
++ ./plus
+ out=15
[ "${out}" = 15 ] || ng "$LINENO"
+ '[' 15 = 15 ']'

[ "${res}" = 0 ] && echo OK
+ '[' 0 = 0 ']'
+ echo OK
OK

out=$(seq 5 | ./plus)
[ "${out}" = 15 ] || ng "$LINENO"

### STRANGE INPUT ###
out=$(echo あ | ./plus)           #計算できない値を入力してみる
[ "$?" = 1 ]      || ng "$LINENO" #終了ステータスが1なのを確認
[ "${out}" = "" ] || ng "$LINENO" #この行と上の行は入れ替えるとダメです
　                                      #（↑なぜかは考えてみましょう)
out=$(echo | ./plus)              #なにも入力しない
[ "$?" = 1 ]      || ng "$LINENO" #これも異常終了する
[ "${out}" = "" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res
