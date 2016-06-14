FROM ubuntu:14.04


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

ADD amanda-backup-client_3.3.9-1Ubuntu1410_amd64.deb /amanda-backup-client_3.3.9-1Ubuntu1410_amd64.deb

CMD ["startup.sh"]
EXPOSE 8069
USER amandabackup
