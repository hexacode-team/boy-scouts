require 'rails_helper'

RSpec.describe "subscribers/index", type: :view do
  before(:each) do
    assign(:subscribers, [
      Subscriber.create!(
        :string => ""
      ),
      Subscriber.create!(
        :string => ""
      )
    ])
  end

  it "renders a list of subscribers" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
