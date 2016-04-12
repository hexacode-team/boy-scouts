require 'rails_helper'

RSpec.describe RoutesController, type: :controller do

  # describe "GET #view_routes" do
  #   it "returns http success" do
  #     get :view_routes
  #     expect(response).to have_http_status(302)
  #   end
  # end
  #route no longer exists for this!
  
  #describe "GET #view_route" do
  # it "returns http success" do
  #   get :view_route
  #   expect(response).to have_http_status(:success)
  # end
  #end

  describe "update a route" do
    before :each do
      @user = double(User, :id => 1, :remember_token => '75585b209fdced059a41a05a736e209699e3fa8e')
      sign_in_as(@user)
      @route = double(Route, :name => "Test Route", :marker => "http://maps.gstatic.com/mapfiles/ridefinder-images/mm_20_purple.png", :id => 10)
      @subscription = double(Subscription, :id => 5, :group_id => 10, :latitude => 30.6099974, :longitude => -96.32311349999999)
      expect(Route).to receive(:find).and_return(@route)
      expect(@user).to receive(:troop_leader?).and_return(true)

    end
    it "should update the coordinates" do
      expect(Subscription).to receive(:find).and_return(@subscription)
      expect(@subscription).to receive(:update_attribute).exactly(3).times.and_return(true)
      expect(@subscription).to receive(:save).and_return(true)
      post :update_route, {:route_id => 10, :sub_id => 5, :lat => 30.6099975, :lon => -96.3231345}
      expect(response).to redirect_to(view_route_path(10))
    end
    it "should modify a marker" do
      expect(@route).to receive(:update_attribute).and_return(true)
      expect(@route).to receive(:save).and_return(true)
      post :modify_marker, {:route_id => 10, :marker_url => 'http://maps.gstatic.com/mapfiles/ridefinder-images/mm_20_purple.png'}
    end
  end

end
