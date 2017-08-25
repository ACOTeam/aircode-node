module.exports = {
  app: {
    port: {{appPort}}
  },
  mongo: {
    host: 'airapi-mongo-{{env}}',
    port: {{mongoPort}},
    user: '',
    pass: '',
    database: '{{env}}-airapi'
  },
  log: {
    appenders: {
      app: {
        type: 'console'
      },
      crash: {
        type: 'file',
        filename: 'log/crash.log',
        maxLogSize: 20480,
        backups: 3,
        category: 'crash'
      }
    },
    categories: {
      default: {
        appenders: ['app'], level: 'info'
      },
      crash: {
        appenders: ['crash'], level: 'error'
      }
    }
  }
}
