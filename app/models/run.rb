class Run < ActiveRecord::Base
  belongs_to :route
  has_and_belongs_to_many :users
end
