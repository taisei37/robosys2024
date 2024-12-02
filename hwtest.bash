#!/bin/bash
# SPSX-FileCopyrightText: 2024 Taisei Suzuki
# SPDX-License-Identifier: BSD-3-Clause

ng() {
    echo "テスト失敗: $1行目が違うよ"
    res=1
}

res=0

# テストケース 1: 有効な数字 (1～12)
out=$(echo 1 | ./birthday 2>/dev/null)
exp=$(printf "あなたの誕生月は: 1月\n誕生石: ガーネット")
if [ "$out" != "$exp" ]; then
    ng "$LINENO"
fi

# テストケース 2: 範囲外の数字 (0)
out=$(echo 0 | ./birthday 2>&1 >/dev/null)
exp="エラー: 月は1から12の範囲で入力してください。"
if [ "$out" != "$exp" ]; then
    ng "$LINENO"
fi

# テストケース 3: 数字以外の入力 (abc)
out=$(echo abc | ./birthday 2>&1 >/dev/null)
exp="エラー: 有効な数字を入力してください。"
if [ "$out" != "$exp" ]; then
    ng "$LINENO"
fi

# テストケース 4: 空入力
out=$(echo "" | ./birthday 2>&1 >/dev/null)
exp="エラー: 有効な数字を入力してください。"
if [ "$out" != "$exp" ]; then
    ng "$LINENO"
fi

# テスト結果
if [ "$res" -eq 0 ]; then
    echo "OK"
fi
exit $res

