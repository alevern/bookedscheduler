FROM php:5.6-fpm
RUN docker-php-ext-install mysqli 
RUN sed -e 's/error_reporting = ALL/error_reporting = E_ERROR | E_PARSE/' -i /usr/local/etc/php/php.ini-development
RUN sed -e 's/;date.timezone =/date.timezone = "Europe\/Paris"/' -i /usr/local/etc/php/php.ini-development
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"
CMD ["php-fpm"]
