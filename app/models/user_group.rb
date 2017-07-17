class UserGroup < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  has_many :invites
end
