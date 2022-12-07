class Swap < ApplicationRecord
  belongs_to :user
  belongs_to :lunch

  enum status: {
    pending: 0,
    requested: 1,
    accepted: 2,
    refused: 3
  }
end
