#!/bin/bash

HEIGHT=20
WIDTH=40
BACKTITLE="JammaPi Menù"
TITLE="JammaPi Menù"
MENU="Scegliere un opzione:"

OPTIONS=(1 "Aggiorna Script"
         2 "Switch JAMMA 15Khz/HDMI"
         3 "Menù Audio"
         4 "Abilita/Disabilita Runcommand RetroPie"
         99 "Lancia script richiesto")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1) bash ~/JammaPi-Small-Form/script/updatescript.sh ;;
        2) bash ~/JammaPi-Small-Form/script/switchvideo.sh ;;
        3) bash ~/JammaPi-Small-Form/script/audio.sh ;;
        4) bash ~/JammaPi/script/runcommandonoff.sh ;;
        99)
        if test -f "/boot/personalizzazione.sh"; then
          echo "$FILE esite!"
          bash /boot/richiesta.sh
          sleep 2
        else
          dialog --title "Hello" --msgbox 'File mancante!' 6 20
          bash ~/JammaPi-Small-Form/script/menu.sh
        fi
        ;;
esac
