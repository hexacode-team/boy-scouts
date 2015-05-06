class RoutesController < ApplicationController
  before_filter :require_login

  def view_routes
    @routes = Route.routes_for(current_user) || [] unless current_user.nil?
  end

  def view_routes_for_group
    group_id = params[:id]
    @group = Group.find(group_id)
    @routes = @group.routes || []

    raise CanCan::AccessDenied.new("You are not authorized to view the requested group!") unless !current_user.get_groups.blank? && current_user.get_groups.include?(@group)
  end

  def view_route
    @route = Route.find(params[:id])

    raise CanCan::AccessDenied.new("You are not authorized to view the requested group!") unless current_user.can_view_route(@route)
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
