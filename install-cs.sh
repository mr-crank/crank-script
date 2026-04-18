#!/bin/bash

# Тот самый оранжевый цвет для красоты
ORANGE='\033[38;5;214m'
NC='\033[0m'

echo -e "${ORANGE}=========================================${NC}"
echo -e "${ORANGE}      Установка Crank's Script           ${NC}"
echo -e "${ORANGE}=========================================${NC}"

# Проверка на root-права (опционально, но полезно)
if [ "$EUID" -ne 0 ]; then
  echo -e "${ORANGE}Пожалуйста, запустите установку от имени root (sudo).${NC}"
  exit
fi

# 1. Ссылка на твой скрипт меню (RAW формат с GitHub)
# ПРИМЕР: https://raw.githubusercontent.com/Crank/server-menu/main/menu.sh
MENU_URL="https://raw.githubusercontent.com/mr-crank/crank-script/refs/heads/main/cs-menu.sh"

# 2. Скачивание скрипта напрямую в системную директорию
echo -e "${ORANGE}[+] Скачивание скрипта...${NC}"
sudo curl -sSL "$MENU_URL" -o /usr/local/bin/

# 3. Выдача прав на выполнение
echo -e "${ORANGE}[+] Настройка прав доступа...${NC}"
sudo chmod +x /usr/local/bin/cs

# 4. Завершение
echo -e "${ORANGE}=========================================${NC}"
echo -e "${ORANGE}Установка успешно завершена!${NC}"
echo -e "${ORANGE}Теперь введите команду ${NC}cs${ORANGE} для запуска меню.${NC}"
echo -e "${ORANGE}=========================================${NC}"
