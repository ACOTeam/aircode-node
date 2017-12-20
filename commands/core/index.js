const genGraphql = require('./graphql')
const genLib = require('./lib')
const genMiddlewares = require('./middlewares')
const genRuntime = require('./runtime')

module.exports = (projectName, resource) => {
  genLib.writeException(projectName)
  genLib.writeArgsBuilder(projectName)
  genLib.writeQueryBuilder(projectName)
  genLib.writeValidator(projectName)
  genMiddlewares.writeOutputFormat(projectName)
  genMiddlewares.writeErrorHandler(projectName)
  genRuntime.writeDb(projectName, resource)
  genRuntime.writeLog(projectName, resource)
  genGraphql.writeMutation(projectName)
  genGraphql.writeSchema(projectName)
}
