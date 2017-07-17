class Place < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :users
  has_many :user_groups
  has_many :users, through: :user_groups
end
