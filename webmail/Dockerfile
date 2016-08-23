#
# Dockerfile for a catch-all SMTP server
#
FROM httpd:2.2

MAINTAINER Vampouille "julien.acroute@camptocamp.com"

ENV DEBIAN_FRONTEND noninterative

# Avoid ERROR: invoke-rc.d: policy-rc.d denied execution of start. 
RUN echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d

RUN apt-get update && \
    apt-get install -y --no-install-recommends postfix courier-base sqwebmail &&\
		rm -fr /var/lib/apt/lists/*

# add a user 'smtp' with password : 'smtp'
RUN useradd -ms /bin/bash -p PcdO6g4gV662A smtp

# enable cgi scripts
RUN a2enmod cgi

# configure redirection on apache
ADD 000-default.conf /etc/apache2/sites-enabled/
RUN mv /var/www/sqwebmail /var/www/html/

# Generate script to run at startup
ADD start.sh /root/
RUN chmod +x /root/start.sh

# Expose the HTTP port
EXPOSE 80

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

CMD ["/root/start.sh"]
