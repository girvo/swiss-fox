FROM node:6.8

# Default our build to production
ARG env=production

# System environment vars
ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm-256color

# Install our base dependencies
RUN apt-get update && \
    apt-get install -y \
        supervisor \
        vim-tiny

# Add our app, install all dependencies
ADD . /app
WORKDIR /app
RUN npm install
ENV NODE_ENV=$env

# Add our service configs
ADD docker/supervisor.$env.conf /etc/supervisor.conf

# Port
EXPOSE 3000

# Supervisord as our front-end process
CMD ["supervisord", "-c", "/etc/supervisor.conf", "-n"]
