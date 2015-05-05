class GroupController < ApplicationController
  def index
		@groups = User.get_groups(current_user.id)
		@user = current_user
	end

	def view_groups
		@groups = current_user.get_groups unless current_user.nil?
		@user = current_user

		#render :layout => "group_layout"
	end

  	def view_group
    end

  def report
    @group = Group.find(params[:id])

  end

  def report_pdf
    @group = Group.find(params[:id])

  end

end
