const mongoose = require('mongoose')
const timestamps = require('mongoose-timestamp')

const schema = new mongoose.Schema({
	{% for key in keys %}
	{{key}}: {{fields[key]}},
	{% endfor %}
	isDeleted: { type: Boolean, default: false }
}, {
  collection: '{{resource}}'
})

schema.plugin(timestamps)

module.exports = schema
