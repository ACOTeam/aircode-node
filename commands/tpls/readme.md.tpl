## {{projectName}}

[![JavaScript Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://standardjs.com)

----

{{projectName}} built using **[Koa](https://github.com/koajs/koa)**

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
  - [Git Flow](#git-flow)
  - [Naming Convention](#naming-convention)
  - [Code Quality](#code-quality)

# Technology Stack

#### [Nodejs](https://github.com/nodejs/node)
Using Nodejs latest version(v8.0+).

#### [Koa](https://github.com/koajs/koa)
Using Koa latest version(v2.3.0).

#### [GraphQL](https://github.com/graphql/graphql-js)
A query language for APIs

#### [Kong](https://github.com/Mashape/kong)
Using for API Gateway.

#### [Docker](https://github.com/moby/moby)
Easy to maintain environment.

#### [MongoDB](https://github.com/Automattic/mongoose)
A NoSql database.

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
	$ curl -XGET http://localhost:3000/books
	```

# Contributing

### Git Flow

1. Clone the project
2. Create a local branch from **development**
3. Make some commits to improve the project
4. Push your local branch to Git repository
5. Open a Pull Request on git
6. Assign project ower to review Pull Request
7. The project ower merges or closes the Pull Request

For more information, you can look up [here](https://gitlab.com/aircode/airapi-doc/wikis/git-flow).

### Naming Convention

Using below convention for file name

#### routes

	# resource_name/http_method.js
	books/get.js
	books/post.js
	books/put.js
	books/delete.js

#### models

	# resource_name
	Book.js

#### services

	# resource_name.js
	# resource_name/function_name.js
	books.js
	books/showMoney.js

#### middlewares

	# middleware_name.js
	outputFormat.js

#### graphql

	# models
	Book.js

### Code Quality

#### [Standard](https://github.com/standard/standard)
A JavaScript style guide

##### plugins

- [standard for vscode](https://marketplace.visualstudio.com/items?itemName=chenxsan.vscode-standardjs)
- [standard for atom](https://atom.io/packages/linter-js-standard)
- [standard for WebStorm](https://blog.jetbrains.com/webstorm/2017/01/webstorm-2017-1-eap-171-2272/)
- [more...](https://github.com/standard/standard#sublime-text)

### Issues

Report issues in [here]().