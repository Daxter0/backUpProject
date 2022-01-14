~~~~~~~~~ SET UP ~~~~~~~~


-> Set clé ssh 

    ssh-keygen

-> Skip le fingerprint ssh 

    ssh sudolec@lesentrecodeurs
    exit

-> mettre la clé publique sur lesentrecodeurs

    ssh-copy-id sudolec@lesentrecodeurs


-> variable  d'environnement $MONGO_USER doit correspondre au nom du projet ( ex : $MONGO_USER="vistoo_USER", $nomDuProjet va renvoyer "vistoo" )

    If $MONGO_USER is not set (serveur client) 
    then
        sudo nano /etc/environment
        MONGO_USER="nomDuProjet_USER"
        source /etc/environment

-> Set variables dans sendItToLesentrecodeurs.sh et extractFilesNDatabase.sh AVANT LE LANCEMENT DE "mainSet.sh"

        ex : nomDuProjet=vistoo
             prefix=VISTOOPWD

-> Mettez le dossier scriptBackUp dans le ~ du serveur client et lancez le "mainSet.sh".



---- mainSet.sh ----


-> Apparement lors du set up de votre serveur vous lancez le crontab et settez l'éditeur par défaut "nano". If not : unquote ligne 13, 15, 17 in "mainSet.sh".
    -> Un "export visual=NANO; crontab -e" est invoqué pendant l'exécution du script. Aucune modification de celui-ci est nécessaire à ce moment, il vous
       suffit simplement de le fermer avec un CTRL+X. 


---- extractFilesNDatabase ----


-> Le script "extractFilesNDatabase.sh" sert à l'extraction de la database ainsi que des fichiers du serveur.

-> Veillez à bien set la variable "préfixe". 



---- sendItToLesentrecodeurs ----


-> Le script "sendItToLesentrecodeurs.sh" sert à l'envoi de la database et des fichiers zippés vers le serveur des entrecodeurs.

-> Veillez à bien set la variable "nomDuProjet" et si nécessaire, unquote la ligne 20 et 21 et set la variable "password".



---- RAPPORT D'ERREUR ----

-> cd /tmp et nano crontab.log pour voir le le rapport de l'exécution de "sendItToLesentrecodeurs.sh" et "extractFilesNDatabase.sh" par le cron.