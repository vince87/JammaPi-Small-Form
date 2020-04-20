#!/bin/bash

HEIGHT=10
WIDTH=60
BACKTITLE="JammaPi Menù"
TITLE="JammaPi switch audio"
MENU="Scegli una delle opzioni:"

OPTIONS=(1 "Imposta audio Mono/Stereo"
         2 "Test audio")

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
            HEIGHT=10
            WIDTH=60
            BACKTITLE="JammaPi Menù"
            TITLE="JammaPi switch audio"
            MENU="Scegli una delle opzioni:"

            OPTIONS=(1 "Imposta audio MONO"
                     2 "Imposta audio STEREO")

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
			bash ~/JammaPi/script/interfaccia.sh -AUD-MONO
			bash ~/JammaPi/script/audio.sh
             ;;

            2)
			bash ~/JammaPi/script/interfaccia.sh -AUD-STEREO
			bash ~/JammaPi/script/audio.sh
             ;;

            esac
            ;;
        2)
            speaker-test -t wav -c 2 -p 1 -l 1
            ;;

esac

bash ~/JammaPi/script/menu.sh
