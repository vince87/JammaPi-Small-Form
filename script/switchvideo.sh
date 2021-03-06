#!/bin/bash

HEIGHT=10
WIDTH=60
BACKTITLE="JammaPi Menù"
TITLE="JammaPi switch video"
MENU="Scegli una delle opzioni:"

OPTIONS=(1 "Switch JAMMA/SCART"
         2 "Switch HDMI")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            dialog --title "JammaPi JAMMA/SCART" \
            --backtitle "JammaPi Menù" \
            --yesno "Vuoi attivare l'uscita JAMMA/SCART? \n Al termine sarà riavviato il sistema!" 7 60
            response=$?
case $response in
               0)
                  bash ~/JammaPi-Small-Form/script/interfaccia.sh -SCART
                  bash ~/JammaPi-Small-Form/script/interfaccia.sh -JAMMA-AUD
                  bash ~/JammaPi-Small-Form/script/interfaccia.sh -AUD-MONO
                  echo "Riavvio in corso!"
                  sudo reboot
               ;;
               1)
                  bash ~/JammaPi/script/switchvideo.sh
               ;;
            esac
            ;;

        2)
            dialog --title "JammaPi HDMI" \
            --backtitle "JammaPi Menù" \
            --yesno "Vuoi attivare l'uscita HDMI? \n Al termine sarà riavviato il sistema!" 7 60
            response=$?
case $response in
               0)
                  bash ~/JammaPi-Small-Form/script/interfaccia.sh -HDMI
                  bash ~/JammaPi-Small-Form/script/interfaccia.sh -HDMI-AUD
                  bash ~/JammaPi-Small-Form/script/interfaccia.sh -AUD-STEREO
                  echo "Riavvio in corso!"
                  sudo reboot
               ;;
               1)
                  bash ~/JammaPi-Small-Form/script/switchvideo.sh
               ;;
            esac
            ;;

esac
if [ "$1" != "1" ] ; then
bash ~/JammaPi-Small-Form/script/menu.sh
fi
