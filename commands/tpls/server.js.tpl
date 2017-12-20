const Koa = require('koa')
const bodyParser = require('koa-bodyparser')
const GrapHTTP = require('koa-graphql')
const Mount = require('koa-mount')
const config = require('config')
const app = new Koa()
const Schema = require('./graphql/schema')

const router = require('./routes')
const outputFormat = require('./middlewares/outputFormat')
const errorHandler = require('./middlewares/errorHandler')
const logger = require('./runtime/log').get('app')

app.use(bodyParser())
app.use(outputFormat())
app.use(errorHandler())
app.use(router.routes())

app.use(Mount('/graphql', GrapHTTP(request => {
  return {
    schema: Schema,
    pretty: true,
    graphiql: true
  }
})))

const APP_ROOT = config.get('app.port') || 3000

app.listen(APP_ROOT)
logger.info(`server is listening on port ${APP_ROOT}`)
