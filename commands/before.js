const fs = require('fs')
const childProcess = require('child_process')
const utils = require('../utils')

function createProject (projectName) {
  childProcess.spawnSync('mkdir', [projectName])
  const projectDir = `${process.cwd()}/${projectName}`
  return projectDir
}

function mkDir (projectDir) {
  const baseDirs = ['config', 'src', 'deploy', 'test']
  const subDirs = ['src/graphql', 'src/graphql/models', 'src/lib', 'src/middlewares', 'src/models', 'src/routes', 'src/services', 'src/runtime',
    'deploy/scripts', 'test/graphql', 'test/lib', 'test/middlewares', 'test/models', 'test/routes', 'test/services']
  const dirs = [...baseDirs, ...subDirs]
  dirs.forEach((dir) => {
    const dirPath = projectDir + '/' + dir
    if (!utils.checkFile(dirPath)) {
      fs.mkdirSync(dirPath)
    }
  })
}

function generate (projectName) {
  const projectDir = createProject(projectName)
  mkDir(projectDir)
}

module.exports = generate
