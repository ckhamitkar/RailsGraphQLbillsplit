module Types
  class QueryType < Types::BaseObject
    # find all users
    field :all_users, [UserType], null: false 
    def all_users
      User.all
    end

    # find all groups
    field :all_groups, [GroupType], null: false
    def all_groups
      Group.all
    end

    # find users by group id
    field :find_users, [UserType], null: false do
      argument :group_id, ID, required: false
    end

    def find_users(group_id: nil)
      Group.find(group_id).users
    end
      # fetch group by id
      field :fetch_group, GroupType, null: false do
        argument :group_id, ID, required: false
      end
  
      def fetch_group(group_id: ID)
        Group.find_by_id(group_id)
      end
  
      # fetch expense by id
      field :fetch_expense, [ExpenseType], null: false do
        argument :group_id, ID, required: false
        argument :user_id, ID, required: false
      end
      def fetch_expense(group_id: nil, user_id: nil)
        Expense.where(group_id: group_id, user_id: user_id)
      end
  end
end
