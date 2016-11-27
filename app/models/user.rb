class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true
  validates :nickname, presence: true

  has_many :group_users
  has_many :groups, through: :group_users

end
