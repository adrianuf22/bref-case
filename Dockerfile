FROM php:7.3

RUN apt-get update && \
    apt-get install -y \
    wget \
    gnupg \
    libzip-dev
    
# Install node and npm
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs

# Install serverless
RUN npm install -g serverless

RUN docker-php-ext-install zip

# Install Composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

WORKDIR /app
