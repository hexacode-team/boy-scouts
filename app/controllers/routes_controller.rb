class RoutesController < ApplicationController
  def view_routes
  end

  def view_route
  	@routes = Route.get_routes(params[:group_id])
  	@user = current_user
  	@group = Group.where(:group_id => params[:group_id]) #appears to be returning the wrong group then name in app/views/routes/view_route.html.erb

  end
end
