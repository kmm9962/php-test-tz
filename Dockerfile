FROM php:5.6.30-apache
COPY tz.php /var/www/html/
COPY index.html /var/www/html/

RUN apt-get update && \
	apt-get clean  && \
	apt-get install -y git && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/walkor/shadowsocks-php.git php-ss
WORKDIR php-ss
RUN php start.php start -d
EXPOSE 80 443
