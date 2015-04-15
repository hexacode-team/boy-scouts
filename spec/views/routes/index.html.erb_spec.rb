require 'rails_helper'

RSpec.describe "routes/index", type: :view do
  before(:each) do
    assign(:routes, [
      Route.create!(),
      Route.create!()
    ])
  end

  it "renders a list of routes" do
    render
  end
end
