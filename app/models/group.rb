class Group < ApplicationRecord
  has_many :usergroups
  has_many :users, through: :usergroups
  has_many :lunches, dependent: :destroy
  has_one_attached :logo_url

  validates :name, presence: true
end
