require 'rails_helper'

RSpec.describe PaymentController, type: :controller do

  describe "GET #generate_invoices_pdf" do
    it "returns http success" do
      get :generate_invoices_pdf
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #generate_invoices_html" do
    it "returns http success" do
      get :generate_invoices_html
      expect(response).to have_http_status(:success)
    end
  end

end
