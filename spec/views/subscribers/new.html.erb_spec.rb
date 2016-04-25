require 'rails_helper'

RSpec.describe "subscribers/new", type: :view do
  before(:each) do
    assign(:subscriber, Subscriber.new(
      :string => ""
    ))
  end

  it "renders new subscriber form" do
    render

    assert_select "form[action=?][method=?]", subscribers_path, "post" do

      assert_select "input#subscriber_string[name=?]", "subscriber[string]"
    end
  end
end
