class SubscriptionController < ApplicationController
  def index
    @invoices = Subscription.get_require_invoices(params[:group_id])
  end

  def generate_invoices
     @invoices = Subscription.get_require_invoices(params[:group_id])
  end

  def generate_invoices_pdf
    @invoices = Subscription.get_require_invoices(params[:group_id])
  end
end
