require 'rails_helper'

RSpec.describe "routes/new", type: :view do
  before(:each) do
    assign(:route, Route.new())
  end

  it "renders new route form" do
    render

    assert_select "form[action=?][method=?]", routes_path, "post" do
    end
  end
end
