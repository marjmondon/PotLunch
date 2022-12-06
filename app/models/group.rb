class Group < ApplicationRecord
  has_many :usergroups
  has_many :users, through: :usergroup
  has_many :lunches
end
