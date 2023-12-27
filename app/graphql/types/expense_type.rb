module Types
    class ExpenseType < Types::BaseObject
      field :id, ID, null: false
      field :amount, Float, null: false
      field :user, Types::UserType, null: false
      field :group, Types::GroupType, null: false
    end
  end