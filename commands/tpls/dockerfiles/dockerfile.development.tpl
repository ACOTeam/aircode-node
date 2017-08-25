FROM airapi-service-base:1.0.0

ARG APP_DIR
ENV NODE_ENV=development
WORKDIR $APP_DIR

EXPOSE 3000

CMD ["pm2-docker", "pm2.yml"]