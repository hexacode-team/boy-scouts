class Route < ActiveRecord::Base
  belongs_to :group
  has_many :subscriptions
  has_many :runs

  def self.get_routes(group_id)
  	routes = Route.where(:group_id => group_id)	
  end

end
