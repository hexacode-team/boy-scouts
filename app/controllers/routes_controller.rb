class RoutesController < ApplicationController

  def view_routes
    @routes = Route.routes_for(current_user) || []
  end

  def view_routes_for_group
    group_id = params[:id]
    @group = Group.find(group_id)
    #TODO make sure @group is in  current_user.get_groups otherwise, shouldn't be able to see this page.
    @routes = @group.routes || []
  end

  def view_route
    @route = Route.find(params[:id])
  end

  def get_run_info
    @route = Route.find(params[:route_id])
    if @route.runs_in_progress?
      render json: @route.runs_in_progress[0]
      return
    end

    render json: false
  end

end
