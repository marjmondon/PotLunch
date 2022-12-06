class Group < ApplicationRecord
  has_many :users, througt: :usergroup
  has_many :lunches, througt: :usergroup
end
