[![JavaScript Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://standardjs.com)

# Airapi scaffold
> A node.js scaffold

Generate node.js web api framework, integrate with Docker and MongoDB.


## Installing
Install by npm
```shell
$ npm install -g aircode-node
```

Install by yarn
```shell
$ yarn add -g aircode-node
```

## Using

List command
```shell
$ aircode-node -h
```

Create a new project
```shell
$ aircode-node new <projectName>
```

Generate model / routes
```shell
$ cd <projectName>
$ aircode-node generate <modelName> <fieldName>:<data type(mongo support)>
```

Run with Docker
```shell
$ make up
```

Run in local
```shell
$ npm install
$ npm run dev
```

## Database
- MongoDB

## Issues

You can report issues in [here](https://github.com/ACOTeam/aircode-node/issues)
