
#driver to run test in firefox
browser = Selenium::WebDriver.for :firefox
browser.navigate.to('http://0.0.0.0:3000/sign_in')
username = browser.find_element(:id, "session_email")
password = browser.find_element(:id, "session_password")
username.send_keys("admin@boyscoutsfd.com")
password.send_keys("secret")
login_attempt = browser.find_element(:xpath, "//*[@id='clearance']/form/input[5]")
login_attempt.submit


Given /^I am testing responsiveness on the (.*) page/ do |name|
  browser.navigate.to('http://0.0.0.0:3000' + path_to(name))
end


When /^the browser width is (.*)px/ do |width|

  browser.manage.window.resize_to(width, 1080)

end

Then /^the element with (.*) "(.*)" should have (.*) : (.*)/ do |attr, attr_val, prop, prop_val|

  if(attr == 'id')
    items = browser.find_element(:id, attr_val).style(prop) == prop_val

  elsif(attr == 'class')
    items = browser.find_element(:class, attr_val).style(prop) == prop_val

  end
end
