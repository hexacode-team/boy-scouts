class GroupController < ApplicationController
  def index
		@groups = User.get_groups(current_user.id)
		@user = current_user
	end

	def view_groups
<<<<<<< HEAD
		@groups = current_user.get_group_admin unless current_user.nil?
=======
		@groups = current_user.get_groups
>>>>>>> dev
		@user = current_user

		#render :layout => "group_layout"
	end

  	def view_group
  	end
end
