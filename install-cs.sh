#!/bin/bash

ORANGE='\033[38;5;214m'
NC='\033[0m'

echo -e "${ORANGE}=========================================${NC}"
echo -e "${ORANGE}      Установка Crank's Script           ${NC}"
echo -e "${ORANGE}=========================================${NC}"

echo -e "${ORANGE}[+] Скачивание скрипта...${NC}"
# Добавлено sudo, чтобы curl мог писать в /usr/local/bin/
sudo curl -sSL https://raw.githubusercontent.com/mr-crank/crank-script/refs/heads/main/cs-menu.sh -o /usr/local/bin/cs

echo -e "${ORANGE}[+] Настройка прав доступа...${NC}"
# Добавлено sudo, чтобы chmod сработал
sudo chmod +x /usr/local/bin/cs

echo -e "${ORANGE}=========================================${NC}"
echo -e "${ORANGE}Установка успешно завершена!${NC}"
echo -e "${ORANGE}Теперь введите команду ${NC}cs${ORANGE} для запуска меню.${NC}"
echo -e "${ORANGE}=========================================${NC}"
