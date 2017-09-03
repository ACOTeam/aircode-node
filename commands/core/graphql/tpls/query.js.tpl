const Graphql = require('graphql')
const db = require('../runtime/db')
const argsBuilder = require('../lib/argsBuilder')
const queryBuilder = require('../lib/queryBuilder')
const {{resource}}s = require('./models/{{resource}}')

module.exports = new Graphql.GraphQLObjectType({
  name: 'ROOT',
  description: 'Search by graphql',
  fields: {
    {{resource.toLowerCase()}}s: {
      type: new Graphql.GraphQLNonNull(new Graphql.GraphQLObjectType({
        name: '{{resource}}Type',
        fields: {
          counts: {
            type: Graphql.GraphQLInt
          },
          rows: {
            type: new Graphql.GraphQLList({{resource}}s)
          }
        }
      })),
      args: argsBuilder({
        _id: {
          type: Graphql.GraphQLString
        }
      }),
      resolve: (_, args) => {
        return new Promise(async(resolve, reject) => {
          const query = db.{{resource}}.find()
          queryBuilder(query, args)
          const results = await query.lean().exec()
          resolve({
            rows: results,
            counts: results.length
          })
        })
      }
    }
  }
})
