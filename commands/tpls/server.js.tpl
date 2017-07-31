const Koa = require('koa')
const bodyParser = require('koa-bodyparser')
const router = require('./routes')
const apiOutputFormat = require('./middlewares/apiOutputFormat')
const config = require('config')
const app = new Koa()
const logger = require('./runtime/log').get('app')

app.use(bodyParser())
app.use(apiOutputFormat())
app.use(router.routes())

const APP_ROOT = config.get('app.port') || 3000

app.listen(APP_ROOT)
logger.info(`server is listening on port ${APP_ROOT}`)
