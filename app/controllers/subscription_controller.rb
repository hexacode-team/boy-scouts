class SubscriptionController < ApplicationController
  def index

    @invoices = Subscription.get_require_invoices(params[:group_id])

    @group = Group.find(params[:group_id])
    @user = current_user
  end

  def generate_invoices
    @invoices = Subscription.get_require_invoices(params[:group_id])

    @group = Group.find(params[:group_id])
    @user = current_user
    @no_header = true
    @display_letter = true

    render :layout => "static_layout"
  end

  def generate_invoices_pdf
    @invoices = Subscription.get_require_invoices(params[:group_id])

    @group = Group.find(params[:group_id])
    @user = current_user
    @no_header = true
    @display_letter = true

    render pdf: "invoices", :layout => "static_layout"

  end

  def add_maintenance_note
    sub = Subscription.find(params[:sub_id])
    sub.maintenance_notes += DateTime.now().to_s + params[:note]
    render json: sub.id
  end

end
