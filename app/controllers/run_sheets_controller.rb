class RunSheetsController < ApplicationController

  #For generating runsheets by User
  def generate_runsheet_pdf
    @user = current_user
    @group = current_user.get_groups
    @nameHash = Hash.new
    @routesHash = Hash.new
    @routes = []
    @routes = Route.where(:group_id => @group[0].id)
    @routes.each do |route|
        @subscribers = []
        @subscribers += route.subscriptions

        @nameHash[route.id] = route.name
          
        @routesHash[route.id] = @subscribers
        @routesHash[route.id].sort_by! {|x| x.visit_sequence}
      end

      render pdf: "runsheets", :layout => "static_layout"
  end

  def generate_runsheet_for_user
    @user = current_user
    @group = current_user.get_groups
    @nameHash = Hash.new
    @routesHash = Hash.new
    @routes = []
    @routes = Route.where(:group_id => @group[0].id)
      @routes.each do |route|
          @subscribers = []
          @subscribers += route.subscriptions

          @nameHash[route.id] = route.name
          
          @routesHash[route.id] = @subscribers
          @routesHash[route.id].sort_by! {|x| x.visit_sequence}
      end
  end

  #For generating runsheets by Group
  def generate_runsheets_pdf
      @user = current_user
      group_id = params[:id]
      @group = Group.find(group_id)
      @nameHash = Hash.new
      @routesHash = Hash.new
      @routes = @group.routes
      @routes.each do |route|
          @subscribers = []
          @subscribers += route.subscriptions
          
          @nameHash[route.id] = route.name

          @routesHash[route.id] = @subscribers
          @routesHash[route.id].sort_by! {|x| x.visit_sequence}
      end

      render pdf: "runsheets", :layout => "static_layout"
  end

  def generate_runsheets_for_group
      @user = current_user
      group_id = params[:id]
      @group = Group.find(group_id)
      @nameHash = Hash.new
      @routesHash = Hash.new
      @routes = @group.routes
      @routes.each do |route|
          @subscribers = []
          @subscribers += route.subscriptions
          
          @nameHash[route.id] = route.name

          @routesHash[route.id] = @subscribers
          @routesHash[route.id].sort_by! {|x| x.visit_sequence}
      end
  end


end
