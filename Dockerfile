FROM node:8.11.3-alpine
USER root
RUN apt-get update
RUN apt-get install -y python
RUN apt-get update
RUN apt-get -y install libgconf2-4 libnss3-1d libxss1
RUN apt-get -y install fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 libgtk-3-0 lsb-release xdg-utils
RUN wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O chrome64.deb
RUN dpkg -i chrome64.deb
RUN npm install --save simple-headless-chrome
