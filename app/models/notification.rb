class Notification < ApplicationRecord
  belongs_to :swap
  belongs_to :user
  has_many :lunches, through: :swaps
  has_many :messages, through: :swaps

end
