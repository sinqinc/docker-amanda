FROM ubuntu:14.04


RUN apt-get update
RUN apt-get install -q -y language-pack-en
RUN update-locale LANG=en_US.UTF-8

RUN apt-get -y install wget sudo bzip2 xinetd curl libglib2.0-0 gettext
RUN service xinetd restart
RUN update-rc.d xinetd defaults

ADD amanda-backup-client_3.3.9-1Ubuntu1404_amd64.deb /amanda-backup-client_3.3.9-1Ubuntu1404_amd64.deb

RUN dpkg -i /amanda-backup-client_3.3.9-1Ubuntu1404_amd64.deb 
ADD amanda-start /amanda-start

CMD ["/amanda-start"]
EXPOSE 10080
USER amandabackup
