#!/bin/bash
repfolder=/home/jka/maps/rujka/maps
checkfile=rujka.mp
svhome='/home/jka/servers'
# 1. Пуллим
cd $repfolder
git pull origin master
# Обходим все сервера
for svdir in $(ls $svhome)
do
	echo -e "\e[1m\e[35mChecking $svdir\e[39m\e[0m"
	cd $svhome/$svdir/
	if test -f "$checkfile"; then
		cd base
		# 2. Удаляем из base все pk3, которые не assets*.pk3 и не rujka_academy5.pk3
		echo -e "\e[33mDeleting old maps...\e[39m"
		find ./*.pk3 -type f -not \( -name 'assets*.pk3' -or -name 'rujka_academy5.pk3' \) -delete
		# 3. Закидываем
		echo -e "\e[33mCopying new maps...\e[39m"
		cp $repfolder/*.pk3 .
	fi
	echo -e "\e[1m\e[32mDone!\e[39m\e[0m"
done
