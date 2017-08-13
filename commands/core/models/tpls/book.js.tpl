const mongoose = require('mongoose')
const timestamps = require('mongoose-timestamp')

const schema = new mongoose.Schema({
  title: String,
  price: Number,
  isDeleted: { type: Boolean, default: false }
}, {
  collection: 'Book'
})

schema.plugin(timestamps)

module.exports = schema
