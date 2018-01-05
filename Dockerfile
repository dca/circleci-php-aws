FROM circleci/php:7.1.9-browsers

RUN sudo apt-get update && \
    sudo apt-get install -y \
        python \
        python-pip

# Install awscli
RUN sudo pip install awscli --upgrade

RUN export PATH=~/.local/bin:$PATH

# Install ecs-deploy
RUN git clone https://github.com/silinternational/ecs-deploy.git /tmp/ecs-deploy
RUN sudo ln -s /tmp/ecs-deploy/ecs-deploy /usr/bin/ecs-deploy

# Install ...
RUN sudo apt-get install -y \
        libjpeg62-turbo-dev \
        libpng-dev \
        zlib1g-dev

RUN sudo docker-php-ext-install zip
RUN sudo docker-php-ext-install gd
RUN sudo docker-php-ext-install bcmath

