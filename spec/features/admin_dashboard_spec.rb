# spec/features/admin_dashboard_spec.rb
feature "Admin dashboard" do
    scenario "visitor is admin" do
        #admin = create(:admin)
        admin = User.create! :email => 'admin2@boyscoutsfd.com', :password => 'secret', :admin => true
        #visit rails_admin_path(as: admin)
        visit '/'
        click_button "Login"
        expect(page).to have_content("Sign in")
        fill_in "session_email", :with => "admin1@boyscoutsfd.com"
        fill_in "session_password", :with => "secret"
        #click_button "Login"
        find('input[type="submit"]').click
        expect(page).to have_content("Welcome back!")
        #visit '/admin'
        
        expect(page).to have_content("Site Administration")
        expect(page).to have_title("Site Administration | Boy Scout Flag Distro Admin")
    end
    
    scenario "visitor is not an admin user" do
        #user = create(:user)
        user = User.create! :email => 'user2@boyscoutsfd.com', :password => 'secret', :admin => false
        
        visit rails_admin_path(as: user)
        #visit '/admin'
        
        expect(page).to have_content("You are not permitted to view this page")
        expect(page).to have_title("Welcome!")
        #expect(page).to have_content("ROFLMAO NO")
    end
end