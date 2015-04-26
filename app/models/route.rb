class Route < ActiveRecord::Base
  belongs_to :group
  has_many :subscriptions
  has_and_belongs_to_many :users

  def self.get_routes(group_id)
  	routes = Route.where(:group_id => group_id)	
  end

end
