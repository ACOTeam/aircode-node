const mongoose = require('mongoose')
const fs = require('fs')
const config = require('config')
const logger = require('./log').get('app')
const path = require('path')
const Bluebird = require('bluebird')

mongoose.Promise = Bluebird

const connectionStr = `mongodb://${config.mongo.host}:${config.mongo.port}/${config.mongo.database}`
const dbConnection = mongoose.createConnection(connectionStr, { user: config.mongo.user, pass: config.mongo.pass })

mongoose.connection.on('error', (err) => logger.error('mongodb connection error:' + err))

const modelsPath = path.join(__dirname, '../models')
const models = fs.readdirSync(modelsPath)
const db = {}
for (let model of models) {
  if (model.startsWith('.')) {
    continue
  }
  const modelName = path.basename(model).split('.')[0]
  const modelSchema = require(path.join(modelsPath, model))
  db[ modelName ] = dbConnection.model(modelName, modelSchema)
}

module.exports = db
