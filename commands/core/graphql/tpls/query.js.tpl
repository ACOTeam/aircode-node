const Graphql = require('graphql')
const db = require('../runtime/db')
const argsBuilder = require('../lib/argsBuilder')
const queryBuilder = require('../lib/queryBuilder')
const Books = require('./models/Book')

module.exports = new Graphql.GraphQLObjectType({
  name: 'ROOT',
  description: 'Search by graphql',
  fields: {
    books: {
      type: new Graphql.GraphQLNonNull(new Graphql.GraphQLObjectType({
        name: 'BookType',
        fields: {
          counts: {
            type: Graphql.GraphQLInt
          },
          rows: {
            type: new Graphql.GraphQLList(Books)
          }
        }
      })),
      args: argsBuilder({
        title: {
          type: Graphql.GraphQLString
        },
        price: {
          type: Graphql.GraphQLInt
        }
      }),
      resolve: (_, args) => {
        return new Promise(async(resolve, reject) => {
          const query = db.Book.find()
          queryBuilder(query, args)
          const books = await query.lean().exec()
          resolve({
            rows: books,
            counts: books.length
          })
        })
      }
    }
  }
})
