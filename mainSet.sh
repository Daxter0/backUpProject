#!/bin/bash

echo Installation des fonctionnalités cron, expect, zip et unzip ...

sudo apt-get update
sudo apt-get install cron
sudo apt-get install expect
sudo apt-get install zip
sudo apt-get install unzip

echo Configuration du cron ...

#echo Une fenêtre crontab va s"'"ouvrir. CTRL+X pour la fermer ...

#sleep 3

#export VISUAL=nano; crontab -e

echo Les heures doivent être comprises entre 0 et 23, les minutes entre 0 et 59.

echo Exécution toutes les heures/minutes grâce au symbole " * ".

echo Attention ! Si vous configurez manuellement, l"'"extraction doit être programmée avant l"'"envoi.

heureZip=2
minuteZip=0
heureSend=2
minuteSend=10
user=$USER

echo Heure extraction/ZIP ? default "=" 2 
  read -r heureZipInput

echo Minute extraction/ZIP ? default "=" 0 
  read -r minuteZipInput

echo Heure envoi ? default "=" 2 
  read -r heureSendInput

echo Minute envoi ? default "=" 10
  read -r minuteSendInput

echo Le cron va maintenant se set up.

if [ -z "$heureZipInput" ] && [ -z "$minuteZipInput" ] && [ -z "$heureSendInput" ] && [ -z "$minuteSendInput" ]
  then
    echo La configuration par défaut va s"'"initialiser ...

    crontab -l > tempfile
    echo -e "SHELL=/bin/bash\n$minuteZip $heureZip * * * BASH_ENV=/etc/profile /home/$user/scriptBackUp/extractFilesNDatabase.sh > /tmp/crontab.log 2>&1\n$minuteSend $heureSend * * * BASH_ENV=/etc/profile /home/$user/scriptBackUp/sendItToLesentrecodeurs.sh > /tmp/crontab.log 2>&1" > tempfile
    crontab tempfile
    rm tempfile
  else
    echo Votre configuration va s"'"initialiser ...

    crontab -l > tempfile
    echo -e "SHELL=/bin/bash\n$minuteZipInput $heureZipInput * * * BASH_ENV=/etc/profile /home/$user/scriptBackUp/extractFilesNDatabase.sh /tmp/crontab.log 2>&1\n$minuteSendInput $heureSendInput * * * BASH_ENV=/etc/profile /home/$user/scriptBackUp/sendItToLesentrecodeurs.sh > /tmp/crontab.log 2>&1" > tempfile
    crontab tempfile
    rm tempfile
fi


echo La configuration de back up de votre serveur est maintenant terminée.

