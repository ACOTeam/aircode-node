const Graphql = require('graphql')

const Query = require('./query')
// const Mutation = require('./mutation')

module.exports = new Graphql.GraphQLSchema({
  query: Query
  // mutation: Mutation
})
