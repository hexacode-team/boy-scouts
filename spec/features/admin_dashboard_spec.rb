# spec/features/admin_dashboard_spec.rb
feature "Admin dashboard" do
    scenario "visitor is admin" do
        #admin = create(:admin)
        admin = User.create! :email => 'admin@boyscoutsfd.com', :password => 'secret', :admin => true
        visit rails_admin_path(as: admin)
        #visit '/admin'
        
        expect(page).to have_content("Site Administration")
        expect(page).to have_title("Site Administration | Boy Scout Flag Distro Admin")
    end
    
    scenario "visitor is not an admin user" do
        #user = create(:user)
        user = User.create! :email => 'user@boyscoutsfd.com', :password => 'secret', :admin => false
        
        visit rails_admin_path(as: user)
        #visit '/admin'
        
        expect(page).to have_content("You are not permitted to view this page")
        expect(page).to have_title("Super Powered Females")
        #expect(page).to have_content("ROFLMAO NO")
    end
end