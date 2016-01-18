#
# Dockerfile for a IMAP server
#
FROM debian:jessie

MAINTAINER Vampouille "julien.acroute@camptocamp.com"

ENV DEBIAN_FRONTEND noninterative

# Avoid ERROR: invoke-rc.d: policy-rc.d denied execution of start. 
RUN echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d

RUN apt-get update && \
    apt-get install -y courier-imap

# add a user 'smtp' with password : 'smtp'
RUN useradd -ms /bin/bash -p PcdO6g4gV662A smtp

# Generate script to run at startup
RUN echo '#!/bin/bash' > /root/start.sh
RUN echo "/usr/lib/courier/courier-authlib/authdaemond &" >> /root/start.sh
RUN echo "/usr/sbin/couriertcpd -address=0 -maxprocs=40 -maxperip=20 -nodnslookup -noidentlookup 143 /usr/lib/courier/courier/imaplogin /usr/bin/imapd Maildir" >> /root/start.sh
RUN chmod +x /root/start.sh

# Expose the IMAP port
EXPOSE 143

CMD ["/root/start.sh"]



