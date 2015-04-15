class Route < ActiveRecord::Base
  belongs_to :group
  has_many :subscriptions
  has_many :runs

end
