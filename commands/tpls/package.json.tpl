{
  "name": "{{projectName}}",
  "version": "1.0.0",
  "description": "airapi demo service",
  "main": "index.js",
  "directories": {
    "test": "test"
  },
  "scripts": {
    "dev": "NODE_ENV=development nodemon --inspect src/server.js",
    "test": "NODE_ENV=test node_modules/mocha/bin/mocha $(find ./test -name *.test.js)",
    "cov": "nyc -r html npm test && open ./coverage/index.html",
    "standard": "node_modules/.bin/standard --fix",
    "airapi": "./node_modules/.bin/airapi-cli build -i ./src/models -i ./src/routes"
  },
  "pre-commit": [
    "standard",
    "test"
  ],
  "keywords": [
    "airapi"
  ],
  "author": "airapi",
  "license": "ISC",
  "dependencies": {
    "airapi-cli": "^2.4.3",
    "any-promise": "^1.3.0",
    "config": "^1.26.1",
    "graphql": "^0.10.5",
    "graphql-tools": "^1.1.0",
    "joi": "^10.6.0",
    "koa": "^2.3.0",
    "koa-bodyparser": "^3.2.0",
    "koa-graphql": "^0.7.1",
    "koa-mount": "^3.0.0",
    "koa-router": "^7.2.1",
    "log4js": "^2.2.0",
    "mongoose": "^4.11.3",
    "mongoose-timestamp": "^0.6.0",
    "pm2": "^2.5.0",
    "yallist": "^3.0.2"
  },
  "devDependencies": {
    "airapi-cli": "^2.4.3",
    "airapi-web": "^2.1.0",
    "mocha": "^3.5.0",
    "nodemon": "^1.11.0",
    "nyc": "^11.0.3",
    "pre-commit": "^1.2.2",
    "standard": "^10.0.3"
  }
}
