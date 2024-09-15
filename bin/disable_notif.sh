#!/bin/bash

# Путь к файлу, который будет хранить состояние уведомлений
STATE_FILE="$HOME/.local/bin/other/.notification_state"

# Проверяем, существует ли файл состояния
if [ ! -f "$STATE_FILE" ]; then
    # Если файл не существует, создаем его и устанавливаем состояние по умолчанию (включено)
    echo "enabled" > "$STATE_FILE"
fi

# Читаем текущее состояние из файла
CURRENT_STATE=$(cat "$STATE_FILE")

# Переключаем состояние уведомлений
if [ "$CURRENT_STATE" == "enabled" ]; then
    # Отключаем уведомления
    notify-send -u normal "Disable notify"
    hyprctl dismissnotify
    echo "disabled" > "$STATE_FILE"
else
    # Включаем уведомления
    hyprctl dismissnotify -1
    echo "enabled" > "$STATE_FILE"
    notify-send -u normal "Enable notify"
fi

