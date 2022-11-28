FROM centos:latest
MAINTAINER ROSHAN-BANTE
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum update -y && yum install -y httpd \
	zip \
	unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page284/rhino.zip /var/www/html
WORKDIR /var/www/html/
RUN unzip rhino.zip
RUN cp -rvf rhino-html/* .
RUN rm -rf rhino.zip
EXPOSE 80
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
