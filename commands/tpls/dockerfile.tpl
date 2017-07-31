FROM node:8-slim

ARG APP_DIR
ARG NODE_ENV

WORKDIR $APP_DIR
COPY ./config $APP_DIR/config
COPY ./src package.json pm2.yml $APP_DIR

RUN npm install -g pm2 && npm install

EXPOSE 3000

CMD ["pm2-docker", "pm2.yml"]