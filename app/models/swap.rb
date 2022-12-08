class Swap < ApplicationRecord
  belongs_to :user
  belongs_to :lunch # , dependent: :destroy
  has_many :chatrooms

  enum status: {
    pending: 0,
    requested: 1,
    accepted: 2,
    refused: 3
  }
end
