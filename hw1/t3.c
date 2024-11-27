#include <stdio.h>
#include <string.h>

void number_to_word() {
    // 数字と対応する誕生石の定義
    int numbers[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
    char *stones[] = {
        "ガーネット", "アメジスト", "アクアマリン", "ダイヤモンド",
        "エメラルド", "パール", "ルビー", "ペリドット",
        "サファイア", "オパール", "トパーズ", "ターコイズ"
    };
    char *flower[] = {
        "スイセン", "ウメ", "サクラ", "チューリップ",
        "バラ", "アジサイ", "ヒマワリ", "ユリ",
        "キキョウ", "コスモス", "キク", "ポインセチア"
    };

    int size = sizeof(numbers) / sizeof(numbers[0]);

    while (1) {
        char input[100];
        printf("あなたの誕生月を入力してください（終了するには 'fin' と入力）: ");
        fgets(input, sizeof(input), stdin);

        // 改行文字を取り除く
        input[strcspn(input, "\n")] = '\0';

        // "fin" と入力されたら終了
        if (strcmp(input, "fin") == 0) {
            printf("プログラムを終了します。\n");
            break;
        }

        // 入力を数字に変換
        int number;
        if (sscanf(input, "%d", &number) == 1) {
            if (number >= 1 && number <= 12) {
                // 誕生石と誕生花を表示
                printf("あなたの誕生石は %s、誕生花は %s です。\n", stones[number - 1], flower[number - 1]);
            } else {
                printf("1から12の間の数字を入力してください。\n");
            }
        } else {
            printf("数字を入力してください。\n");
        }
    }
}

int main() {
    number_to_word();
    return 0;
}

