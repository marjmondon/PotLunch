class Message < ApplicationRecord
  belongs_to :swap
  belongs_to :user
end
