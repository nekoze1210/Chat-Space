class Group < ApplicationRecord
  validates :title, presence: true

  has_many :users, through: :group_users
  has_many :group_users
  accepts_nested_attributes_for :users, allow_destroy: true
end
