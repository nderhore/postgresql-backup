#l'application source
FROM postgres:16.2-alpine

#copier le script de sauvegarde dans le container
COPY ./backup.sh /usr/local/bin/backup.sh
RUN chmod +x ./usr/local/bin/backup.sh

#Configurer la cronjob
RUN apt-get update && apt-get -y install cron
RUN echo "5 * * * * /usr/local/bin/backup.sh > /proc/1/fd/1 2>/proc/1/fd/2" >> /etc/crontab
