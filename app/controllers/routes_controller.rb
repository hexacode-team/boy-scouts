class RoutesController < ApplicationController
  before_filter :require_login

  def view_routes
    #displays list of routes that signed in user has ability to see.
    @routes = Route.routes_for(current_user) || [] unless current_user.nil?
  end

  def view_routes_for_group
    #display list of routes that belong to a particular group.

    group_id = params[:id]
    @group = Group.find(group_id)
    @routes = @group.routes || []

    #If the user doesn't have access to view this information for the given group, then raise an access denied error.
    #Users access this group if it is included in user.get_groups
    raise CanCan::AccessDenied.new("You are not authorized to view the requested group!") unless !current_user.get_groups.blank? && current_user.get_groups.include?(@group)
  end

  def view_route
    @route = Route.find(params[:id])

    @marker_url = @route.marker

    #Building markers for google maps
    @hash = Gmaps4rails.build_markers(@route.subscriptions) do |subscription, marker|
      marker.lat subscription.latitude
      marker.lng subscription.longitude
      marker.infowindow subscription.name
      marker.json({ id: subscription.id})
      #TODO: Add 'subscription.marker into db and assign pngs for each subscription'
      #TODO: Create a form to update subscription coordinates from the draggable icons
      marker.picture({
                         :url => @marker_url,
                         :width   => 32,
                         :height  => 32
                     })
    end
    #If the user doesn't have access to view this information for the given group, then raise an access denied error.
    raise CanCan::AccessDenied.new("You are not authorized to view the requested group!") unless current_user.can_view_route(@route)
  end

  def modify_marker
    @route = Route.find(params[:route_id])
    @route.update_attribute(:marker, params[:marker_url])
    @route.save
    redirect_to view_route_path(params[:route_id])
    raise CanCan::AccessDenied.new("You are not authorized to change marker images!") unless current_user.troop_leader? || current_user.admin?
  end

  def update_route
    @route = Route.find(params[:route_id])
    @subscription = @route.subscriptions.find(params[:sub_id])
    @subscription.update_attribute(:latitude, params[:lat])
    @subscription.update_attribute(:longitude, params[:lon])

    lat = params[:lat]
    lon = params[:lon]
    query = "#{lat},#{lon}"
    first_result = Geocoder.search(query).first
    if first_result.present?
      @subscription.update_attribute(:address_line_1, first_result.street_address)
    end

    @subscription.save
    redirect_to view_route_path(params[:route_id])
    #If the user id not a troop leader or an admin, they cannot change markers
    raise CanCan::AccessDenied.new("You are not authorized to change marker locations!") unless current_user.troop_leader? || current_user.admin?
  end

  def get_run_info
    #this action is only used by javascript. If a valid run is currently happening, return it's progress, otherwise false.
    @route = Route.find(params[:route_id])
    if @route.runs_in_progress?
      render json: @route.runs_in_progress[0]
      return
    end

    render json: false
  end

end
