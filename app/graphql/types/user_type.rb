module Types
    class UserType < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :email, String, null: false
      field :expenses, [Types::ExpenseType], null: false
    end
end