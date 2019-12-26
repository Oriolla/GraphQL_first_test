GeekType = GraphQL::ObjectType.define do
  name 'Geek'
  description 'A Geek Type'
  field :id, types.ID
  field :name, types.String
  field :resume, types.String
  field :applies do
    type types[ApplyType] # types declaration for collection
    argument :size,
             types.Int,
             default_value:15
    resolve -> (geek,args,ctx){
      geek.applies.limit(args[:size]).order(id:asc) #:desc
    }
  end
end