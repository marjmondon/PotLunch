class Notification < ApplicationRecord
  belongs_to :swap
  belongs_to :user
  has_many :lunches, through: :swaps
  has_many :messages, through: :swaps

  enum category: {
    message: 0,
    swap: 1
  }
end
