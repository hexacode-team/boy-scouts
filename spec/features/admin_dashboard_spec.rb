# spec/features/admin_dashboard_spec.rb
require 'spec_helper'
require 'rails_helper'
feature "Admin dashboard" do

    scenario "visitor is admin" do
        #Create a test Admin user
        admin = User.create :email => 'a@b.com', :password => 'tests', :first_name => "First", :last_name => "Last"
     
        admin_role = Role.create! :role=> "SiteAdmin"
        
        #Create a test group to function as a SiteAdmin
        groupAdmin = Group.create! :name => "SiteAdmins", :admin => true unless Group.find_by_name("SiteAdmins")
        groupAdmin.roles << admin_role unless groupAdmin.blank?
        
        #Add user to group
        groupAdmin.users << admin unless groupAdmin.blank?

        #visit the admin path as the newly created admin
        visit rails_admin_path(as: admin)
        expect(current_path).to eq(rails_admin_path)
    end
    
    scenario "visitor is not an admin user" do
        user = User.create :email => 'a@b.com', :password => 'tests'
        
        visit rails_admin_path(as: user)
        expect(current_path).to eq(root_path)
    end
end
