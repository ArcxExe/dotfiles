#!/usr/bin/env bash
# Путь к файлу, который будет хранить состояние уведомлений
STATE_FILE="$HOME/.local/bin/other/touchpad.status"

# Проверяем, существует ли файл состояния
if [ ! -f "$STATE_FILE" ]; then
    # Если файл не существует, создаем его и устанавливаем состояние по умолчанию (включено)
    echo "enabled" > "$STATE_FILE"
fi

# Читаем текущее состояние из файла
CURRENT_STATE=$(cat "$STATE_FILE")

# Переключаем состояние уведомлений
if [ "$CURRENT_STATE" == "enabled" ]; then
    # Отключаем
    hyprctl keyword '$TOUCH' false
    hyprctl keyword device:a ''
    echo "disabled" > "$STATE_FILE"
    notify-send -u normal "Touchpad disabled"
else
    # Включаем 
    hyprctl keyword '$TOUCH' true
    hyprctl keyword device:a ''
    echo "enabled" > "$STATE_FILE"
    notify-send -u normal " Touchpad enabled"
fi
