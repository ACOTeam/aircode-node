const router = require('koa-router')()
const graphqlKoa = require('graphql-server-koa').graphqlKoa
const Joi = require('joi')
const validator = require('../lib/validator')
const schema = require('../graphql/schema')

Joi.objectId = () => Joi.string().hex().length(24)

module.exports = router

