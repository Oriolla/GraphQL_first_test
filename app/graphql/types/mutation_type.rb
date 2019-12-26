# module Types
#   class MutationType < Types::BaseObject
#     # TODO: remove me
#     field :test_field, String, null: false,
#       description: "An example field added by the generator"
#     def test_field
#       "Hello World"
#     end
#   end
# end


Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'
  # mutation {
  #   new_company: createCompany(name: "Hannila", location: "anna@mail.ru") {
  #     id
  #     name
  #     location
  #   }
  # }
  field :createCompany do
    type CompanyType
    description 'Creates new Company'
    argument :name, !types.String
    argument :location, !types.String
    resolve ->(obj, args, ctx) {
      new_company = Company.create(name: args[:name], location: args[:location])
      new_company
    }
  end
  # mutation {
  #   new_job: createJob(
  #       name: "new Job 1",
  #       place: "Contract",
  #       company_id:1
  #   ) {
  #     id
  #     name
  #     company_id
  #     place
  #   }
  # }
  field :createJob do
    type JobType
    description 'Creates new Job'
    argument :name, !types.String
    argument :place, !types.String
    argument :company_id, !types.ID
    resolve ->(obj, args, ctx) {
      new_job = Job.create!(
          name: args[:name],
          place: args[:place],
          company_id: args[:company_id])
      new_job
    }
  end

end
