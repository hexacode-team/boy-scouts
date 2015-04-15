require 'rails_helper'

RSpec.describe "routes/show", type: :view do
  before(:each) do
    @route = assign(:route, Route.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
