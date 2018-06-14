FROM debian:stretch
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  apache2 libapache2-mod-php php-dompdf php-xml php7.0-mbstring php-sqlite3 \
  && rm -rf /var/lib/apt/lists/*

ADD https://github.com/roundcube/roundcubemail/releases/download/1.3.0/roundcubemail-1.3.0-complete.tar.gz /tmp/
RUN cd /var/www/html/ \
  && tar xzf /tmp/roundcubemail-1.3.0-complete.tar.gz \
  && mv roundcubemail-1.3.0/ webmail \
  && chown -R www-data:www-data webmail/ \
  && rm -fr /var/www/html/webmail/installer
COPY config.inc.php /var/www/html/webmail/config/config.inc.php
COPY autologon.php /var/www/html/webmail/plugins/autologon/autologon.php
COPY index.html /var/www/html/
RUN mkdir -p /mnt/sqlite/roundcube \
  && chown -R www-data /mnt/sqlite/roundcube
VOLUME /mnt/sqlite
EXPOSE 80
CMD /bin/bash -c "source /etc/apache2/envvars && apache2 -D FOREGROUND"


