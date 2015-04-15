class SubscriptionController < ApplicationController
  def index

    @invoices = Subscription.get_require_invoices(params[:group_id]).sort do |a, b|
      comp = (a.last_name <=> b.last_name)
      comp.zero? ? (a.first_name <=> b.first_name) : comp
    end

    @group = Group.find(params[:group_id])
    @user = current_user
  end

  def generate_invoices
    @invoices = Subscription.get_require_invoices(params[:group_id]).sort do |a, b|
      comp = (a.last_name <=> b.last_name)
      comp.zero? ? (a.first_name <=> b.first_name) : comp
    end

    @group = Group.find(params[:group_id])
    @user = current_user
    @no_header = true
  end

  def generate_invoices_pdf
    kit = PDFKit.new(generate_invoices_pdf_url , :page_size => 'Letter', :orientation=>'Portrait')
    pdf = kit.to_pdf
    send_data(pdf, :filename => "consolidated_invoices.pdf",  :type => "application/pdf")
  end
end
