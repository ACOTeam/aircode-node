#!/usr/bin/env node

const fs = require('fs')
const nunjucks = require('nunjucks')
const filePath = __dirname

const envs = ['test', 'production', 'development']

function writeFileByEnv () {
  const configTpl = fs.readFileSync(filePath + '/tpls/config.js.tpl').toString()
  for (let i = 0; i < envs.length; i++) {
    const env = envs[i]
    const dockerfileTpl = fs.readFileSync(filePath + `/tpls/dockerfiles/dockerfile.${env}.tpl`).toString()
    const runScriptTpl = fs.readFileSync(filePath + `/tpls/scripts/run-${env}.sh.tpl`).toString()
    writeDockerfile(env, dockerfileTpl)
    writeConfig(env, configTpl)
    writeScript(env, runScriptTpl)
  }
}

function writeScript (env, template) {
  const options = {}
  const runScript = nunjucks.renderString(template, options)
  fs.writeFileSync(`./${process.env.projectName}/deploy/scripts/run-${env}.sh`, runScript)
}

function writeConfig (env, template) {
  const options = {
    appPort: 3000,
    mongoHost: 'localhost',
    mongoPort: 27017,
    env
  }

  const config = nunjucks.renderString(template, options)
  fs.writeFileSync(`./${process.env.projectName}/config/${env}.js`, config)
}

function writeDockerfile (env, template) {
  const options = {}
  const dockerfile = nunjucks.renderString(template, options)
  fs.writeFileSync(`./${process.env.projectName}/deploy/Dockerfile.${env}`, dockerfile)
}

function writeBaseDockerfile () {
  const dockerfileBaseTpl = fs.readFileSync(filePath + '/tpls/dockerfiles/dockerfile.base.tpl').toString()
  const options = {}
  const dockerfileBase = nunjucks.renderString(dockerfileBaseTpl, options)
  fs.writeFileSync(`./${process.env.projectName}/deploy/Dockerfile.base`, dockerfileBase)
}

function writeBaseScripts () {
  const buildBaseScriptTpl = fs.readFileSync(filePath + '/tpls/scripts/build-base.sh.tpl').toString()
  const runMongoScriptTpl = fs.readFileSync(filePath + '/tpls/scripts/run-mongo.sh.tpl').toString()
  const options = {}
  const buildBaseScript = nunjucks.renderString(buildBaseScriptTpl, options)
  const runMongoScript = nunjucks.renderString(runMongoScriptTpl, options)
  fs.writeFileSync(`./${process.env.projectName}/deploy/scripts/build-base.sh`, buildBaseScript)
  fs.writeFileSync(`./${process.env.projectName}/deploy/scripts/run-mongo.sh`, runMongoScript)
}

function writeServer () {
  const serverTpl = fs.readFileSync(filePath + '/tpls/server.js.tpl').toString()
  const options = {}
  const server = nunjucks.renderString(serverTpl, options)
  fs.writeFileSync(`./${process.env.projectName}/src/server.js`, server)
}

function writePackage () {
  const projectName = process.env.projectName
  const packageTpl = fs.readFileSync(filePath + '/tpls/package.json.tpl').toString()
  const options = { projectName }
  const packageJson = nunjucks.renderString(packageTpl, options)
  fs.writeFileSync(`./${projectName}/package.json`, packageJson)
}

function writeMakefile () {
  const makefileTpl = fs.readFileSync(filePath + '/tpls/makefile.tpl').toString()
  const options = {}
  const makefile = nunjucks.renderString(makefileTpl, options)
  fs.writeFileSync(`./${process.env.projectName}/Makefile`, makefile)
}

function writePm2 () {
  const projectName = process.env.projectName
  const pm2Tpl = fs.readFileSync(filePath + '/tpls/pm2.yml.tpl').toString()
  const options = { projectName }
  const pm2 = nunjucks.renderString(pm2Tpl, options)
  fs.writeFileSync(`./${projectName}/pm2.yml`, pm2)
}

function writeReadme () {
  const projectName = process.env.projectName
  const readmeTpl = fs.readFileSync(filePath + '/tpls/readme.md.tpl').toString()
  const options = { projectName }
  const readme = nunjucks.renderString(readmeTpl, options)
  fs.writeFileSync(`./${projectName}/README.md`, readme)
}

function writeAirapi () {
  const projectName = process.env.projectName
  const airapiTpl = fs.readFileSync(filePath + '/tpls/airapi.json.tpl').toString()
  const options = { projectName }
  const airapi = nunjucks.renderString(airapiTpl, options)
  fs.writeFileSync(`./${projectName}/.airapi.json`, airapi)
}

function writeGitigonre () {
  const projectName = process.env.projectName
  const gitigonreTpl = fs.readFileSync(filePath + '/tpls/gitigonre.tpl').toString()
  const options = { projectName }
  const gitigonre = nunjucks.renderString(gitigonreTpl, options)
  fs.writeFileSync(`./${projectName}/.gitignore`, gitigonre)
}

function writer (projectName) {
  process.env.projectName = projectName
  writeFileByEnv()
  writeBaseDockerfile()
  writeBaseScripts()
  writeServer()
  writePackage()
  writeMakefile()
  writePm2()
  writeReadme()
  writeAirapi()
  writeGitigonre()
}

module.exports = writer
