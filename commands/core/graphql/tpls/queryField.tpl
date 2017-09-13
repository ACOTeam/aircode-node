    {{resource.toLowerCase()}}: {
      type: new Graphql.GraphQLNonNull(new Graphql.GraphQLObjectType({
        name: '{{resource}}Type',
        fields: {
          counts: {
            type: Graphql.GraphQLInt
          },
          rows: {
            type: new Graphql.GraphQLList(require('./models/{{resource}}'))
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
    },
  }
})
