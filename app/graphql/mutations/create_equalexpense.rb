module Mutations
    class CreateEqualexpense < BaseMutation
    argument :group_id, ID, required: false
    argument :user_id, ID, required: false
    argument :amount, Float, required: false
    argument :members, [ID], required: false

    type Types::ExpenseType

    def resolve(group_id: nil, user_id: nil, amount: nil, members: nil)
        
        # update main expense
        @old_expense = Expense.where(user_id: user_id, group_id: group_id).first
        @expense_new = @old_expense.update(amount: @old_expense.amount.to_i + amount)
        

        # splitting amount
        members.each do |member|
            old_row = Expense.where(user_id: member, group_id: group_id).first
            new_row = old_row.update(amount: old_row.amount.to_i - amount/members.length())
        end
        
        Expense.first 

    end
    end
end