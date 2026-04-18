#!/bin/bash

# ANSI код для оранжевого цвета (256 цветов)
#ORANGE='\033[38;5;214m'
ORANGE='\x1b[38;5;172m'
NC='\033[0m' # Сброс цвета (No Color)

# Функция для паузы после выполнения команды
pause() {
    echo ""
    echo -en "${ORANGE}Нажмите Enter для возврата в меню...${NC}"
    read
}

while true; do
    # Получение публичных IP-адресов (с таймаутом 2 секунды)
    sys_ipv4=$(curl -s -4 --max-time 2 icanhazip.com || echo "Не назначен")
    sys_ipv6=$(curl -s -6 --max-time 2 icanhazip.com || echo "Не назначен")
    
    # Если curl вернул пустоту (например, сервер без интернета), заменяем на текст
    [ -z "$sys_ipv4" ] && sys_ipv4="Не назначен"
    [ -z "$sys_ipv6" ] && sys_ipv6="Не назначен"
    
    # Сбор системной информации
    sys_uptime=$(uptime -p | sed 's/up //')
    sys_ram=$(free -h | awk '/^Mem:/ {print $3 " / " $2}')
    sys_load=$(cat /proc/loadavg | awk '{print $1 ", " $2 ", " $3}')

    clear
    echo -e "${ORANGE}=========================================${NC}"
    echo -e "               Crank's Script                  "
    echo -e "${ORANGE}=========================================${NC}"
    echo -e "${ORANGE} IPv4   : ${NC}${sys_ipv4}"
    echo -e "${ORANGE} IPv6   : ${NC}${sys_ipv6}"
    echo -e "${ORANGE} Аптайм : ${NC}${sys_uptime}"
    echo -e "${ORANGE} RAM    : ${NC}${sys_ram}"
    echo -e "${ORANGE} CPU    : ${NC}${sys_load}"
    echo -e "${ORANGE}=========================================${NC}"
    echo -e "${ORANGE}1. Обновить систему (apt update/upgrade)${NC}"
    echo -e "${ORANGE}2. Проверить статус брандмауэра (ufw)${NC}"
    echo -e "${ORANGE}3. Запустить Remnawave Reverse${NC}"
    echo -e "${ORANGE}4. Запустить установку Remnawave Reverse${NC}"
    echo -e "${ORANGE}5. IP Region Check${NC}"
    echo -e "${ORANGE}6. CensorCheck${NC}"
    echo -e "${ORANGE}7. GeoBlock${NC}"
    echo -e "${ORANGE}8. Bench${NC}"
    echo -e "${ORANGE}9. IPQuality${NC}"
    echo -e "${ORANGE}10. Обновить скрипт${NC}"
    echo -e "${ORANGE}0. Выход${NC}"
    echo -e "${ORANGE}=========================================${NC}"
    echo -en "${ORANGE}Выберите действие (0-6): ${NC}"
    read choice

    case $choice in
        1)
            echo -e "${ORANGE}Запуск обновления системы...${NC}"
            sudo apt update && sudo apt upgrade -y
            pause
            ;;
        2)
            echo -e "${ORANGE}Статус UFW:${NC}"
            sudo ufw status
            pause
            ;;
        3)
            sudo remnawave_reverse
            pause
            ;;
        4)
            bash <(curl -Ls https://raw.githubusercontent.com/eGamesAPI/remnawave-reverse-proxy/refs/heads/main/install_remnawave.sh)
            pause
            ;;
        5)
            bash <(wget -qO- https://raw.githubusercontent.com/Davoyan/ipregion/main/ipregion.sh)
            pause
            ;;
        6)
            bash <(wget -qO- https://github.com/vernette/censorcheck/raw/master/censorcheck.sh) --mode dpi
            pause
            ;;
        7)
            bash <(wget -qO- https://github.com/vernette/censorcheck/raw/master/censorcheck.sh) --mode geoblock
            pause
            ;;
        8)
            wget -qO- bench.sh | bash
            pause
            ;;
        9)
            bash <(curl -Ls https://Check.Place) -EI
            pause
            ;;
        10)
            bash <(curl -sSL https://raw.githubusercontent.com/mr-crank/crank-script/main/install-cs.sh)
            pause
            ;;
        0)
            echo -e "${ORANGE}Выход...${NC}"
            exit 0
            ;;
        *)
            echo -e "${ORANGE}Неверный выбор. Пожалуйста, введите число от 0 до 6.${NC}"
            sleep 2
            ;;
    esac
done
