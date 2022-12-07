class Message < ApplicationRecord
  belongs_to :swaps
  belongs_to :user
end
