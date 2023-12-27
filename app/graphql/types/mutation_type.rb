module Types
  class MutationType < Types::BaseObject
    field :create_group, mutation: Mutations::CreateGroup
    field :create_equalexpense, mutation: Mutations::CreateEqualexpense
  end
end
