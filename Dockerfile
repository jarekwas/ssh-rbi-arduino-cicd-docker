FROM debian:stretch-slim


RUN apt-get update && \
    apt-get install -y curl git

RUN curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=/bin/ sh || exit 0

RUN arduino-cli core update-index && \
    arduino-cli core install arduino:avr


RUN apt-get remove docker docker.io runc   && \
    apt-get install -y apt-transport-https ca-certificates gnupg2 software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -  && \
    add-apt-repository "deb [arch=armhf] https://download.docker.com/linux/debian $(lsb_release -cs) stable"  && \
    apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io && \
    docker -v

RUN echo "deb https://packagecloud.io/Hypriot/Schatzkiste/debian/ jessie main" | sudo tee /etc/apt/sources.list.d/hypriot.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 37BBEE3F7AD95B3F && \
    apt-get update && \
    apt-get install -y --allow-unauthenticated docker-compose 



CMD ['arduino-cli']