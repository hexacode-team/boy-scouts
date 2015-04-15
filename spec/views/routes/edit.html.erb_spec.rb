require 'rails_helper'

RSpec.describe "routes/edit", type: :view do
  before(:each) do
    @route = assign(:route, Route.create!())
  end

  it "renders the edit route form" do
    render

    assert_select "form[action=?][method=?]", route_path(@route), "post" do
    end
  end
end
