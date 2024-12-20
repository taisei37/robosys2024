#robosys2024
ロボットシステム学授業用(課題1)
# 誕生石を教えるコマンド
[![test](https://github.com/taisei37/robosys2024/actions/workflows/test.yml/badge.svg)](https://github.com/taisei37/robosys2024/actions/workflows/test.yml)
このリポジトリは、誕生石を教えるコマンドです。入力された月に応じてその月の誕生石を表示します。入力に相応しくない値が入力された際、エラーメッセージが表示されるようになっています。その他動作確認のテストスプリクト（hwtest.bash）も含まれています。

## 機能

- 入力された月に応じてその月の誕生石を表示します。
- 自分の誕生石を知りたい方に向けて作成しました。
- 主な機能として月以外（1~12）以外の数字や記号、空白が入力された際エラーメ>
ッセージが表示されるようになっています

## 必要なソフトウェア
- python
  -テスト済みバージョン：3.7~3.12

## テスト環境
- Ubuntu 20.04 LTS

## 使用方法と実行方法の例


- 1.このリポジトリをクローン

```
git clone https://github.com/taisei37/robosys2024.git
```

- 2.ディレクトリの移動

```
cd robosys2024
```

- 3.birthdayの実行

実行方法

```
echo <整数>　| ./birthday
```

適切な入力例

```
echo 1　| ./birthday
###実行結果###
あなたの誕生月は: 1月
誕生石: ガーネット
```

不適切な入力例１

```
echo 0　| ./birthday
###実行結果###
エラー: 月は1から12の範囲で入力してください。
```

不適切な入力例2

```
echo 0　| ./birthday
###実行結果###
エラー: 有効な数字を入力してください。
```

## サンプルコ―ド
```
   #!/usr/bin/python3
   #SPSX-FileCopyrightText: 2024 Taisei Suzuki
   #SPDX-License-Identifier: BSD-3-Clause

import sys

def main():
    stones = [
        "ガーネット", "アメジスト", "アクアマリン", "ダイヤモンド",
        "エメラルド", "パール", "ルビー", "ペリドット",
        "サファイア", "オパール", "トパーズ", "ターコイズ"
    ]

    user = sys.stdin.read().strip()

    if not user:
        print("エラー: 有効な数字を入力してください。")
        return

    try:
        month = int(user)

        if 1 <= month <= 12:
            stone = stones[month - 1]
            print(f"あなたの誕生月は: {month}月")
            print(f"誕生石: {stone}")
        else:
            print("エラー: 月は1から12の範囲で入力してください。")
    except ValueError:
        print("エラー: 有効な数字を入力してください。")

if __name__ == "__main__":
    main()
```
## ライセンスと著作権

このソフトウェアパッケージは３条項BSDライセンスの下、再頒布および使用が許可されてされています。

© 2024 Taisei Suzuki

