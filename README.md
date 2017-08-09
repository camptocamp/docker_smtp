# docker_smtp
A simple docker image with SMTP, IMAP and a webmail. This composition is dedicated to development environements because it will accept all emails and never relay to internet. 

This composition will launch 3 services in 3 images:
* SMTP service on port 25, run by `smtp-sink`
* IMAP service on port 143, run by `courier-imap` (User : **smtp**, password: **smtp**)
* WEBMAIL service on port *8080*, run by `apache2` and `roundcube` at http://127.0.0.1:8080/webmail/

SMTP will accept all emails and store every emails receive on port 25 to only one mailbox. This mailbox can be read with a webmail available on port 8080 or with IMAP protocol available on standard port 143.

Usage :

```bash
git clone https://github.com/camptocamp/docker_smtp.git
cd docker_smtp/
# docker-compose build # (optional step)
docker-compose up
```

Then you can configure apps to send emails to local port 25 and you can read received emails on http://127.0.0.1:8080/webmail/
