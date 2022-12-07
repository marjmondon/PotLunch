class Lunch < ApplicationRecord
  has_many_attached :photos
  belongs_to :group
  belongs_to :user
  has_many :swaps

  validates :cooking_date, presence: true
  validates :title, presence: true
end
