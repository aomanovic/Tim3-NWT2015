class UserType < ActiveRecord::Base
  has_many :users

  validates :user_type, length: { maximum: 20 }
  validates :user_type, presence: true
end
