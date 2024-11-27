#include <stdio.h>
#include <string.h>

void number_to_word() {
    // 数字と対応する単語の定義
    int numbers[] = {1,2,3,4,5,6,7,8,9,10,11,12};
    char *ston[] = {"ガーネット", "アメジスト", "アクアマリン", "ダイヤモンド", "エメラルド","パール","ルビー","ペリドット","サファイア","オパール","トパーズ","ターコイズ"};
    int size = sizeof(numbers) / sizeof(numbers[0]);

    while (1) {
        char input[100];
        printf("あなたの誕生月を入力してください（終了するには 'exit' と入力）: ");
        scanf("%s", input);

        // "exit" と入力されたら終了
        if (strcmp(input, "exit") == 0) {
            printf("終了します。\n");
            break;
        }

        // 入力を数字に変換
        int number;
        if (sscanf(input, "%d", &number) == 1) {
            int found = 0;
            for (int i = 0; i < size; i++) {
                if (numbers[i] == number) {
                    printf("%dあなたの誕生石は %s\nです", number, ston[i]);
                    found = 1;
                    break;
                }
            }
            if (!found) {
                printf("対応する単語が見つかりません\n");
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
