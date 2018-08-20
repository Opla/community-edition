FROM node:8.11 as builder

ARG OPLA_BACKEND_DATABASE_HOST=db
ARG OPLA_BACKEND_DATABASE_NAME=opla
ARG OPLA_BACKEND_DATABASE_USER=opla
ARG OPLA_BACKEND_DATABASE_PASS=foo 

RUN apt-get update && \
    apt-get install -y \
      zip \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /srv

RUN cd /tmp && wget https://github.com/Opla/backend/archive/master.zip && \
    unzip master.zip && \
    mv backend-master /srv/app && \
    rm /tmp/master.zip


RUN cd /srv/app \
    && yarn install \
    && ./bin/opla init \
    --non-interactive \
    --database-host $OPLA_BACKEND_DATABASE_HOST \
    --database-name $OPLA_BACKEND_DATABASE_NAME \
    --database-user $OPLA_BACKEND_DATABASE_USER \
    --database-pass $OPLA_BACKEND_DATABASE_PASS \ 
    && yarn compile

FROM node:8.11

RUN apt-get update && \
    apt-get install -y \
      netcat \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /srv/app

WORKDIR /srv/app

COPY --from=builder /srv/app/bin ./bin
COPY --from=builder /srv/app/config ./config
COPY --from=builder /srv/app/dist ./dist
COPY --from=builder /srv/app/migrations ./migrations
COPY --from=builder /srv/app/package.json .
COPY --from=builder /srv/app/yarn.lock .

RUN yarn install --production

COPY ./bin/entrypoint.sh /srv/entrypoint.sh
RUN chmod u+x /srv/entrypoint.sh

ENTRYPOINT [ "/srv/entrypoint.sh" ]
