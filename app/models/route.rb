class Route < ActiveRecord::Base
  belongs_to :group
  has_many :subscriptions
  has_and_belongs_to_many :users

end
