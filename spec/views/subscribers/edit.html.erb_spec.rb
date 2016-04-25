require 'rails_helper'

RSpec.describe "subscribers/edit", type: :view do
  before(:each) do
    @subscriber = assign(:subscriber, Subscriber.create!(
      :string => ""
    ))
  end

  it "renders the edit subscriber form" do
    render

    assert_select "form[action=?][method=?]", subscriber_path(@subscriber), "post" do

      assert_select "input#subscriber_string[name=?]", "subscriber[string]"
    end
  end
end
