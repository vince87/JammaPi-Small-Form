#!/bin/bash

HEIGHT=20
WIDTH=40
BACKTITLE="JammaPi Menù"
TITLE="JammaPi Menù"
MENU="Scegliere un opzione:"

OPTIONS=(1 "Aggiorna Script"
         2 "Switch JAMMA 15Khz/HDMI"
         3 "Menù Audio"
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
        1) bash ~/JammaPi/script/updatescript.sh ;;
        2) bash ~/JammaPi/script/switchvideo.sh ;;
        2) bash ~/JammaPi/script/audio.sh ;;
        99)
        if test -f "/boot/personalizzazione.sh"; then
          echo "$FILE esite!"
          bash /boot/richiesta.sh
          sleep 2
        else
          dialog --title "Hello" --msgbox 'File mancante!' 6 20
          bash ~/JammaPi/script/menu.sh
        fi
        ;;
esac
