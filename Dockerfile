FROM debian:stable 
MAINTAINER Mario Ruiz web2.0opensource@gmail.com 
RUN apt-get update;apt-get install apache2 -y; apt-get install nano; apt-get clean
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2/
ENV APACHE_RUN_DIR /var/run/apache2/
ENV APACHE_LOCK_DIR /var/lock/apache2/
ENV APACHE_MY_CERT_NAME mySite.com
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid
VOLUME ["/var/www/"]
ADD runIt /root/runIt
EXPOSE 80 443
CMD /bin/bash /root/runIt
