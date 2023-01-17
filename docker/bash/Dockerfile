# Purpose: Run a bash shell customized for @kevinchangjk

# base image from ubuntu
FROM ubuntu
SHELL ["/bin/bash", "-c"]

# set up ~/fullstops
WORKDIR /root/fullstops
COPY . .

RUN chmod +x ~/fullstops/setup && ~/fullstops/setup
