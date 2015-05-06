class RunSheetsController < ApplicationController

  # For generating runsheets by group.
  def generate_runsheets_pdf
    @group = Group.find(params[:id])    
    @generate_fields = true

    prepare_runsheets_for_routes(@group.routes)

    raise CanCan::AccessDenied.new("You are not authorized to view the requested group!") unless !current_user.get_groups.blank? && current_user.get_groups.include?(@group)
    render pdf: "runsheets", :layout => "static_layout", :orientation => "Landscape"
  end

  def generate_runsheets_for_group
    @group = Group.find(params[:id])

    raise CanCan::AccessDenied.new("You are not authorized to view the requested group!") unless !current_user.get_groups.blank? && current_user.get_groups.include?(@group)
    prepare_runsheets_for_routes(@group.routes)
  end

  def prepare_runsheets_for_routes(routes)
    @routes = routes
    @nameHash = Hash.new
    @routesHash = Hash.new
    routes.each do |route|
      @subscribers = []
      @subscribers += route.subscriptions
        
      @nameHash[route.id] = route.name

      @routesHash[route.id] = @subscribers
      @routesHash[route.id].sort_by! { |x| x.print_sequence }
    end
  end

end
