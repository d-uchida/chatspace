class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, length: { minimum: 3 }
  validates :email, presence: true
  has_many :messages
  has_many :user_groups
  has_many :groups, through: :user_groups
end
