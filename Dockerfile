FROM ubuntu:22.04

RUN echo 'root:CUPS!' | chpasswd

COPY wsl.conf /etc/wsl.conf

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install samba=2:4.15.13+dfsg-0ubuntu1.1 -y
RUN apt-get install avahi-daemon=0.8-5ubuntu5.1 -y
RUN apt-get install cups=2.4.1op1-1ubuntu4.4 -y
COPY cupsd.conf /etc/cups/cupsd.conf
RUN useradd -g lpadmin cupsadmin

COPY drivers/idprt_tspl_printer_linux_driver_v1.4.2/ppd/sp310.tspl.ppd /usr/share/cups/model
COPY drivers/idprt_tspl_printer_linux_driver_v1.4.2/ppd/sp320.tspl.ppd /usr/share/cups/model
COPY drivers/idprt_tspl_printer_linux_driver_v1.4.2/ppd/sp410.tspl.ppd /usr/share/cups/model
COPY drivers/idprt_tspl_printer_linux_driver_v1.4.2/ppd/sp420.tspl.ppd /usr/share/cups/model

COPY startup.sh startup.sh
ENTRYPOINT ["sh", "./startup.sh"]
