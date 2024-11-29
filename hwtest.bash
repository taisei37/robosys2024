#!/usr/bin/python3
#SPSX-FileCopyrightText: 2024 Taisei Suzuki
#SPDX-License-Identifier: BSD-3-Clausei#include <stdio.h>#!/bin/bash -xv

# テストの結果を格納する変数
res=0

# テストヘルパー関数テストが失敗した場合にエラーを出力し、失敗状態を記録するための役割
ng() {
    echo "${1}行目がちがうよ"
    res=1
}

# テストケース 1: 有効な月 (1～12)
out=$(echo -e "1\nfin\n" | birr)
expected="あなたの誕生月は: 1月
誕生石: ガーネット
誕生花: スイセン
続ける場合は誕生月を入力。終了させたい場合はfinを入力
プログラムを終了"
[ "$out" = "$expected" ] || ng "$LINENO"

# テストケース 2: 範囲外の数字 (13)
out=$(echo -e "13\nfin\n" | birr)
expected="エラー: 月は1から12の範囲で入力してください。
プログラムを終了"
[ "$out" = "$expected" ] || ng "$LINENO"

# テストケース 3: 数字以外の入力 (abc)
out=$(echo -e "abc\nfin\n" | birr)
expected="エラー: 有効な数字を入力してください。
プログラムを終了"
[ "$out" = "$expected" ] || ng "$LINENO"

# テストケース 4: 終了入力のみ (fin)
out=$(echo -e "fin\n" | birr)
expected="プログラムを終了"
[ "$out" = "$expected" ] || ng "$LINENO"

# テストケース 5: 空入力
out=$(echo -e "\nfin\n" | birr)
expected="エラー: 有効な数字を入力してください。
プログラムを終了"
[ "$out" = "$expected" ] || ng "$LINENO"

# テスト結果
[ "$res" = 0 ] && echo "OK"
exit $res
