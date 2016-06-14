docker-openerp/Dockerfile
3cda1f6  22 hours ago
@sinqinc sinqinc Fix startup path
2 contributors @jmcarbo @sinqinc
RawBlameHistory    61 lines (50 sloc)  2.08 KB
# openerp app
#
# Usage: docker run dpaw/openerp [provisionAndRun|run|provision]
#
# Description: based on
#              http://www.theopensourcerer.com/2012/12/how-to-install-openerp-7-0-on-ubuntu-12-04-lts/
#
# Sets: 
#
# Exposes: 8080/openerp
#

FROM ubuntu:14.04
MAINTAINER Joan Marc Carbo Arnau <jmcarbo@gmail.com>

RUN apt-get update
RUN apt-get install -q -y language-pack-en
RUN update-locale LANG=en_US.UTF-8

RUN apt-get install -q -y vim

# project settings
ENV project_name amandaclient
ENV project_root /home/amandabackup/


RUN adduser --system --home=$project_root --group amandabackup

RUN apt-get -y install wget sudo bzip2

RUN adduser amandabackup sudo

ADD startup.sh /usr/local/sbin/startup.sh

CMD ["startup.sh"]
EXPOSE 8069
USER amandabackup
