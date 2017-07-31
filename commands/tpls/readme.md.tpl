## {{projectName}}

----

{{projectName}} built using [Koa]()

**Table of Content**

- [Technology Stack](#technology-stack)
	- [Nodejs](#nodejs)
	- [Koa](#koa)
	- [GraphQL](#graphql)
	- [Kong](#kong)
	- [Docker](#docker)
	- [MongoDB](#mongodb)
- [Install](#install)
- [Contributing](#contributing)
	- [Naming Convention](#naming-convention)
	- [Code Quality](#code-quality)


# Technology Stack

### [Nodejs](https://github.com/nodejs/node)
Using Nodejs latest version(v8.0+).

### [Koa](https://github.com/koajs/koa)
Using Koa latest version(v2.3.0).

### [GraphQL](https://github.com/graphql/graphql-js)
A query language for APIs

### [Kong](https://github.com/Mashape/kong)
Using for API Gateway.

### [Docker](https://github.com/moby/moby)

### [MongoDB](https://github.com/Automattic/mongoose)

# Install
- clone this repository

	```shell
	$ git clone git@gitlab.com:aircode/airapi-node.git
	```

- run with docker(make sure docker is already)

	```shell
	$ make build
	$ make run
	```

- checking

	```shell
	$ curl -XGET http://localhost:3000/hello/100
	```

# Contributing

## Naming Convention

### Using below convention for file name

#### routes

	# resource_name/http_method.js
	hello/get.js
	hello/post.js
	hello/put.js
	hello/delete.js

#### models

	# resource_name
	hello.js

#### services

	# resource_name.js
	# resource_name/function_name.js
	hello.js
	hello/showMoney.js

#### middlewares

	# middleware_name.js
	apiOutPutFormat.js

#### graphql

	# [TODO]

### Code Quality

#### [Standard](https://github.com/standard/standard)
A JavaScript style guide

##### plugins

- [standard for vscode](https://marketplace.visualstudio.com/items?itemName=chenxsan.vscode-standardjs)
- [standard for atom](https://atom.io/packages/linter-js-standard)
- [standard for WebStorm](https://blog.jetbrains.com/webstorm/2017/01/webstorm-2017-1-eap-171-2272/)
- [more...](https://github.com/standard/standard#sublime-text)