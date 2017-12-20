const fs = require('fs')
const path = require('path')
const config = require('config')
const logPath = path.join(__dirname, '/../../log')

if (!fs.existsSync(logPath)) {
  fs.mkdirSync(logPath)
}

const log4js = require('log4js')
log4js.configure(config.get('log'))

module.exports = {
  get: name => {
    const logger = log4js.getLogger(name)
    logger.level = process.env.NODE_ENV === 'development' ? 'TRACE' : 'INFO'
    return logger
  }
}
