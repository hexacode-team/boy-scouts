class RunSheetsController < ApplicationController
  def generate_runsheet_pdf
    #route_id = params[:route_id]
  end

  def generate_runsheet
    #route_id = params[:route_id]
  end

  def generate_runsheets_pdf
  end

  def generate_runsheets_for_group
      @user = current_user
      group_id = params[:id]
      @group = Group.find(group_id)
      @routesHash = Hash.new
      @routes = @group.routes
      @routes.each do |route|
          @subscribers = []
          @subscribers += route.subscriptions
          
          @routesHash[route.id] = @subscribers
          @routesHash[route.id].sort_by! {|x| x.visit_sequence}
      end
      return @routes
  end


end
