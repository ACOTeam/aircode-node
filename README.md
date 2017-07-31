## Airapi scaffold

----

Using:

```shell
$ npm install -g aircode-node
$ aircode-node -h
$ aircode-node new hello todos
```

after new a project, you can use docker or node to start.

Running:

- Docker
```shell
$ cd hello
$ make build
$ make run
```

- Node monitor
```shell
$ cd hello
$ npm i
$ nodemon src/server.js
```

#### Issues

You can report issues in [here](https://github.com/ACOTeam/aircode-node/issues)

#### TODO List

- add command
	- airapi-node generate model field:type
	- airapi-node generate route post [get | put | delete]
- refactor generateFile.js
- enhance structure
