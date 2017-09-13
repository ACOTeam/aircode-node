const router = require('koa-router')()
const Joi = require('joi')
const validator = require('../lib/validator')
Joi.objectId = () => Joi.string().hex().length(24)

module.exports = router

