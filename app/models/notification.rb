class Notification < ApplicationRecord
  belongs_to :swap
  has_many :lunches, though: :swaps
  has_many :messages, through: :swaps
end
