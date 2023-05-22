#!/bin/bash

# 1. Вывести на экран 3 раза имя пользователя
for i in {1..3}; do
    echo $(whoami)
done

# 2. Вывести с помощью цикла while все четные числа от 0 до 100 включительно
n=0
while [ $n -le 100 ]; do
    if [ $(($n % 2)) -eq 0 ]; then
        echo $n
    fi
    n=$(($n + 1))
done

# 3. Командой 'cut' вывести для текущей папки права доступа файлов (первая колонка вывода команды ‘ll’). Отсортировать этот вывод (команда ‘sort’). Удалить дубликаты (команда ‘uniq’). Использовать для решения конвейер обработки задач (pipeline - вертикальный слэш).
ls -l --color=never | cut -d ' ' -f 1 | sort | uniq

# 4.* Написать скрипт очистки директорий. На вход принимает путь к директории. Если директория существует, то удаляет в ней все файлы с расширениями .bak, .tmp, .backup. Если директории нет, то выводит ошибку.
cleanup_dir() {
    if [ ! -d "$1" ]; then
        echo "Error: directory does not exist"
        exit 1
    fi

    extensions=(bak tmp backup)

    for ext in "${extensions[@]}"; do
        find "$1" -name "*.$ext" -type f -delete
    done
}

cleanup_dir /path/to/directory
