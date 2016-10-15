FROM node:6.8

ARG env=production

ADD . /app
WORKDIR /app
RUN npm install
ENV NODE_ENV=$env

WORKDIR /
ADD docker/start.$env.sh /start.sh
CMD ["/start.sh"]

EXPOSE 3000