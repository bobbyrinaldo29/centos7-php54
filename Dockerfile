FROM centos:centos7

LABEL maintainer="Sukma Dewa"

# Set repository to Vault
RUN sed -i 's|^mirrorlist=|#mirrorlist=|g' /etc/yum.repos.d/CentOS-*.repo
RUN sed -i 's|^#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*.repo
RUN yum clean all
RUN yum makecache

# Install necessary packages
RUN yum -y install initscripts deltarpm epel-release
RUN yum -y update

RUN yum -y install httpd vim

RUN yum -y install \
    php php-cli php-bcmath php-bz2 php-common \
    php-curl php-dba php-gd php-json php-mbstring \
    php-opcache php-readline php-soap php-xml \
    php-xmlrpc php-zip php-ctype php-pdo \
    php-mysql php-imagick php-intl

# Set PHP configuration
RUN sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 100M/' /etc/php.ini
RUN sed -i 's/post_max_size = 8M/post_max_size = 100M/' /etc/php.ini
RUN sed -i 's|^short_open_tag = Off|short_open_tag = On|' /etc/php.ini
RUN sed -i 's|^;error_log = php_errors.log|error_log = /var/www/html/log/php_errors.log|' /etc/php.ini

# Set timezone to Asia/Jakarta
ENV TZ=Asia/Jakarta
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./pear/ /usr/share/
COPY ./vhost.conf /etc/httpd/conf.d/
RUN systemctl enable httpd

# Set WORKDIR and expose port
WORKDIR /var/www/html
EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]