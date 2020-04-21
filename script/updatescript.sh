#!/bin/bash
dialog --title "JammaPi aggiorna script" \
            --backtitle "JammaPi Menù" \
            --yesno "Vuoi aggiornare lo script della JammaPi? \n Al termine sarà riavviato il sistema!" 7 60
            response=$?
case $response in
               0)
                  cd ~/JammaPi-Small-Form
                  git reset --hard origin/master
                  git pull
                  wget -O - https://github.com/vince87/JammaPi-Small-Form/raw/master/install.sh | bash
               ;;
               1)
                  bash ~/JammaPi/script/menu.sh
               ;;
            esac

