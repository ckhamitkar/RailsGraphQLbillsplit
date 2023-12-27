class User < ApplicationRecord
    has_many :expenses
    has_many :groups, through: :expenses
end
