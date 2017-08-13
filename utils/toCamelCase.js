module.exports = (str) => {
  return str.replace(/( |^)[a-z]/g, (initial) => initial.toUpperCase())
}
