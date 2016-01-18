#
# Dockerfile for a catch-all SMTP server
#
FROM tianon/apache2

MAINTAINER Vampouille "julien.acroute@camptocamp.com"

ENV DEBIAN_FRONTEND noninterative

# Avoid ERROR: invoke-rc.d: policy-rc.d denied execution of start. 
RUN echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d

RUN apt-get update && \
    apt-get install -y postfix courier-base sqwebmail

# add a user 'smtp' with password : 'smtp'
RUN useradd -ms /bin/bash -p PcdO6g4gV662A smtp

# enable cgi scripts
RUN a2enmod cgi

# configure redirection on apache
RUN echo "<VirtualHost *:80>" > /etc/apache2/sites-enabled/000-default.conf
RUN echo "	ServerAdmin webmaster@localhost" >> /etc/apache2/sites-enabled/000-default.conf
RUN echo "	DocumentRoot /var/www/html" >> /etc/apache2/sites-enabled/000-default.conf
RUN echo "	ErrorLog /proc/self/fd/2" >> /etc/apache2/sites-enabled/000-default.conf
RUN echo "	CustomLog /proc/self/fd/1 combined" >> /etc/apache2/sites-enabled/000-default.conf
RUN echo "  RedirectMatch ^/$ /cgi-bin/sqwebmail" >> /etc/apache2/sites-enabled/000-default.conf
RUN echo "</VirtualHost>" >> /etc/apache2/sites-enabled/000-default.conf

# Generate script to run at startup
RUN echo '#!/bin/bash' > /root/start.sh
RUN echo "/etc/init.d/courier-authdaemon start" >> /root/start.sh
RUN echo "/etc/init.d/sqwebmail start" >> /root/start.sh
RUN echo "apache2 -DFOREGROUND" >> /root/start.sh 
RUN chmod +x /root/start.sh

# Expose the HTTP port
EXPOSE 80

CMD ["/root/start.sh"]
