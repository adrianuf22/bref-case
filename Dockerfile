FROM php:7.3

# wget is for installing Composer
# gnupg is for installing node
# zlib1g-dev is for the zip PHP extension
RUN apt-get update && \
    apt-get install -y \
    wget \
    gnupg \
    libzip-dev
    
RUN rm -rf /var/lib/apt/lists/*

# Install node and npm
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs

# Install serverless
RUN npm install -g serverless

RUN docker-php-ext-install zip

# Install Composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

WORKDIR /app
