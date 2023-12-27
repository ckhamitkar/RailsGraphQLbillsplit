module Mutations
    class CreateGroup < BaseMutation
      # arguments passed to the `resolve` method
      argument :name, String, required: true
      argument :users, [String], required: true
      
      # return type from the mutation
      type Types::GroupType
  
      def resolve(name: nil, users: nil)
        @group = Group.create!(
          name: name
        )

        users.each do |u|
          @group.users << User.where(email: u).first
        end

        @group
      end
    end
end