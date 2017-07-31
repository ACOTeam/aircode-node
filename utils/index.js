const fs = require('fs')

class Utils {
  static checkFile(file) {
    const isExist = fs.existsSync(file)
    if (isExist) console.log(`${file} is exist.`)
    return isExist;
  }

  static checkFieldType(fieldType) {
    const isValid = /^\w+:\w+$/.test(fieldType)
    return isValid
  }
}

module.exports = Utils;
