Given /^I am testing on the (.*) page and then clicking (.*)/ do |name, section|
  $browser.navigate.to('http://0.0.0.0:3000' + path_to(name))
  $browser.find_element(:xpath, "/html/body/div[2]/div/div[1]/div/ul[1]/li[8]/a").click;
end
