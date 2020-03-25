#!/bin/bash

HEIGHT=20
WIDTH=40
BACKTITLE="JammaPi Menù"
TITLE="JammaPi Menù"
MENU="Scegliere un opzione:"

OPTIONS=(1 "Aggiorna Script"
         2 "Abilita/Disabilita controlli analogici"
         3 "Abilita/Disabilita Runcommand RetroPie"
         4 "Switch JAMMA 15Khz/HDMI"
         5 "Abilita/Disabilita Kiosk Mode"
         6 "Lancia script richiesto")

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
        2) bash ~/JammaPi/script/analogjs.sh ;;
        5) bash ~/JammaPi/script/runcommandonoff.sh ;;
        6) bash ~/JammaPi/script/switchvideo.sh ;;
        7) bash ~/JammaPi/script/kiosk.sh ;;
        8)
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
