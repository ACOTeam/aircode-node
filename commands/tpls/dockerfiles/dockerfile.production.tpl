FROM airapi-service-base:1.0.0

ARG APP_DIR
ENV NODE_ENV=production
WORKDIR $APP_DIR

COPY package.json pm2.yml $APP_DIR 
COPY config $APP_DIR/config
COPY src $APP_DIR/src

RUN ["npm", "install"]

EXPOSE 3000

CMD ["pm2-docker", "pm2.yml"]