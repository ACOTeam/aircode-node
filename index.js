#!/usr/bin/env node

var program = require('commander');
var fs = require('fs')
var utils = require('./utils')
var commands = require('./commands')

program.version('0.1.0')
if (!process.argv.slice(2).length) {
  program.outputHelp()
}

program
	.command('new <name> [resource]')
	.description('create an airapi service structure')
	.action(function() {
		const projectName = process.argv[3]
		const resource = process.argv[4] || 'todos'
		try {
			commands.before(projectName)
			commands.genBaseFile(projectName)
			commands.core(projectName, resource)
		} catch(error) {
			console.log(error)
			fs.rmdirSync(projectName)
		}
	})

program
	.command('generate <model> <field:type>')
	.alias('g')
	.description('create a model')
	.action(function() {
		// TODO
		const model = process.argv[3]
		const fieldTypes = process.argv.slice(4, process.argv.length)
		const schema = {}
		fieldTypes.forEach((fieldType) => {
			if (utils.checkFieldType(fieldType)) {
				const splitFiledType = fieldType.split(':')
				const key = splitFiledType[0]
				const type = splitFiledType[1]
				schema[key] = type
			} else {
				console.log(`invalid: ${fieldType} `)
			}
		})
		console.log(schema)
	})

program.parse(process.argv)
