class Lunch < ApplicationRecord
  has_many_attached :photos
  belongs_to :group
  belongs_to :user


  validates :cooking_date, presence: true
  validates :title, presence: true
end
