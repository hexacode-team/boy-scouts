# spec/features/welcome_spec.rb
require 'spec_helper'
require 'rails_helper'

feature "Welcome screen" do
  before { visit root_path }

  scenario "visitor cannot access routes" do
    expect(page).not_to have_selector(:link_or_button, "Routes")
  end

  scenario "users can access routes" do
      route_user = User.create :email => 'a@b.com', :password => 'secret', :can_view_routes => true, :first_name => "Ricky", :last_name => "Bobby"
    
    #Create Group Roles
    troop_leader_role = Role.create! :role=> "TroopLeader" unless Role.find_by_role("TroopLeader")
    troop_member_role = Role.create! :role=> "TroopMember" unless Role.find_by_role("TroopMembers")
    
    #Create a group to function as a Troop and set the admin to the created default admin
    groupTroopLeader = Group.create! :name => "Troop01Leader" unless Group.find_by_name('Troop01')
#    groupTroopLeader.roles << troop_leader_role unless groupTroopLeader.blank?
    
    group1 = Group.create! :name => "Troop01" unless Group.find_by_name('Troop01')
    group1.roles <<  troop_member_role unless group1.blank?
    
    group1.users << route_user
    
    visit root_path(as: route_user)
    expect(page).to have_link("Routes")
  end
end