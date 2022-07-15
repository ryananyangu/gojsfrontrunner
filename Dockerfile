FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update
# RUN apt-get dist-upgrade -y
# Install ca-certificate. Required to verify tokens
RUN apt install -y ca-certificates npm nodejs

RUN npm install -g yarn
# Set default user to a non-root user
RUN useradd -rm -d /home/gojsuser -s /bin/bash -g users -G sudo -u 1000 gojsuser
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER gojsuser