Given /^I am on the (.*) page/ do |name|
		if name == "home"
				visit path_to("home")
		end

		if name == "dashboard"
				visit path_to("admin")
		end
end

When /^I click on the (.*) link/ do |link|
		if link == "admin"
				visit path_to("admin")
		end

		if link == "dashboard"
				visit path_to("admin")
		end
end

Then /^I should land on the (.*) page/ do |page|
		if page == "admin"
				expect(current_path) == path_to("admin")
		end

		if page == "dashboard"
				expect(current_path) == path_to("admin")
		end
end