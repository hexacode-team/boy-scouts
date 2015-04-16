class Group < ActiveRecord::Base
  belongs_to :user
  has_many :users
  has_many :routes
  has_many :subscriptions

end
