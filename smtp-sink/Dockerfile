#
# Dockerfile for a catch-all SMTP server
#
FROM debian:stretch

MAINTAINER Vampouille "julien.acroute@camptocamp.com"

ENV DEBIAN_FRONTEND noninterative

RUN apt-get update && \
    apt-get install -y postfix courier-base && \
    rm -rf /var/lib/apt/lists/*

# add a user 'smtp' with password : 'smtp'
RUN useradd -ms /bin/bash -p PcdO6g4gV662A smtp

# Run the rest of the commands as the ``smtp`` user
USER smtp
WORKDIR /home/smtp
RUN maildirmake Maildir

# export Maildir
VOLUME /home/smtp/Maildir/

# Expose the SMTP port
EXPOSE 25

USER root
CMD ["smtp-sink", "-c", "-d", "/home/smtp/Maildir/new/%M.", "-u", "smtp", "0.0.0.0:25", "10"]
