FROM centos:centos6
RUN yum -y install httpd
RUN yum -y install mod_ssl
RUN yum -y install php php-common php-gd php-mysql php-intl php-xml php-xmlrpc php-soap php-pecl-apc php-odbc php-mbstring php-openssl php-mcrypt php-pear php-devel
ADD ipaexg.ttf /usr/share/fonts/ipaexg.ttf
ADD ipaexm.ttf /usr/share/fonts/ipaexm.ttf
ADD php.ini /etc/php.ini
RUN useradd www-data
RUN usermod -u 1000 www-data && groupmod -g 1000 www-data
ADD httpd.conf /etc/httpd/conf/httpd.conf
RUN yum -y install wget
RUN wget http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-centos6-amd64.rpm
RUN yum install -y xorg-x11-fonts-75dpi xorg-x11-fonts-Type1 libXext libXrender libpng libjpeg-turbo
RUN rpm -ivh wkhtmltox-0.12.2.1_linux-centos6-amd64.rpm
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
