module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :sites, [Types::SiteType], null: false do
      argument :id, ID, required: false
    end

    def sites(**args)
      if args[:id]
        Site.where(id: args[:id]).limit(10)
      else
        Site.all
      end
    end

    field :test_2, String, null: false
    def test_2
      {}.to_json
    end

    field :test_3, String, null: false
    def test_3
      "helloe test3"
    end
  end
end
