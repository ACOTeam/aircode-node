const Graphql = require('graphql')

module.exports = new Graphql.GraphQLObjectType({
  name: 'Book',
  description: 'Search books',
  fields: {
    _id: {
      type: Graphql.GraphQLString
    },
    title: {
      type: Graphql.GraphQLString
    },
    price: {
      type: Graphql.GraphQLInt
    }
  }
})
