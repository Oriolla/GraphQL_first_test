require './app/graphql/types/job_type.rb'

CompanyType = GraphQL::ObjectType.define do
  name 'Company'
  description 'A Company Type'
  field :id, types.ID
  field :name, types.String
  field :location, types.String
  field :deleted, types.Boolean

  field :jobs do
    type types[JobType] # types declaration for collection
    argument :size,
             types.Int,
             default_value: 15
    resolve ->(company, args, ctx) {
      company.jobs.limit(args[:size]).order(id: :asc) # :desc
    }
  end
end
