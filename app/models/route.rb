class Route < ActiveRecord::Base
  belongs_to :group
  has_many :subscriptions
  has_many :runs

  def self.get_routes(group_id)
  	groups = Group.where(:group_id => group_id)
  	routes = []

  	groups.each do |group|
  		routes += Route.where(:group_id => group.id)
  	end

  end

end
