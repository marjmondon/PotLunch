class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lunches
  has_many :usergroups
  has_many :groups, through: :usergroups

  validates :first_name, presence: true
  validates :last_name, presence: true
end
