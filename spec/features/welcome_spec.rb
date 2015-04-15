# Welcome For New User or Welcome Back for Existing User
feature "Welcome Screen" do
    scenario "visitor is guest" do
        visit '/'
        expect(page).to have_title("Welcome!")
    end

    scenario "visitor is user" do
    	user = User.create! :email => 'user3@boyscoutsfd.com', :password => 'secret', :admin => false
        visit '/'
        click_button "Login"
        visit '/sign_in'
        expect(page).to have_content("Sign in")
        fill_in 'session_email', :with => "user@boyscoutsfd.com"
        fill_in 'session_password', :with => "secret"
        find('input[type="submit"]').click
        #visit '/'
        #click_button "submit"
        expect(page).to have_content("Welcome back!")
    #expect(page).to have_title("Welcome Back!")
    end
end