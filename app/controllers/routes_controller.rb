class RoutesController < ApplicationController
  def view_routes
  end

  def view_route
  	@routes = Route.get_routes(params[:group_id])
  	@user = current_user
  	@group = Group.where(:group_id => params[:group_id])
  end
end
