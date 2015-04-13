class Route < ActiveRecord::Base
  belongs_to :group
  has_many :runs

end
