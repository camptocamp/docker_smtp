#
# Dockerfile for a catch-all SMTP server
#
FROM tianon/apache2

MAINTAINER Vampouille "julien.acroute@camptocamp.com"

ENV DEBIAN_FRONTEND noninterative

# Avoid ERROR: invoke-rc.d: policy-rc.d denied execution of start. 
RUN echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d

RUN apt-get update && \
    apt-get install -y postfix courier-base sqwebmail &&\
		rm -fr /var/lib/apt/lists/*

# add a user 'smtp' with password : 'smtp'
RUN useradd -ms /bin/bash -p PcdO6g4gV662A smtp

# enable cgi scripts
RUN a2enmod cgi

# configure redirection on apache
ADD 000-default.conf /etc/apache2/sites-enabled/

# Generate script to run at startup
ADD start.sh /root/
RUN chmod +x /root/start.sh

# Expose the HTTP port
EXPOSE 80

CMD ["/root/start.sh"]
