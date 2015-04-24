class UsersController < ApplicationController
	def index
		@groups = User.get_group_admin(params[:id])
		@user = current_user
	end

	def view_groups
		@groups = User.get_group_admin(params[:id])
		@user = current_user

		#render :layout => "group_layout"
	end
end