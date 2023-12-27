module Types
    class GroupType < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :expenses, [Types::ExpenseType], null: false
    end  
  end