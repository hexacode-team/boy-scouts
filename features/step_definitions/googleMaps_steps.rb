


Given /^I am testing googleMaps on the routes (.*) page/ do |route_id|
  $browser.navigate.to('http://0.0.0.0:3000/routes/' + route_id )
end


When /^I am (.*) user/ do |user_type|
  admin_exist = $browser.find_element(:xpath, "//*[@id='main-nav']/ul/li[2]/a")

end

Then /^the element with (.*) "(.*)" should exist/ do |attr, attr_val|

  if(attr == 'id')
    items = $browser.find_element(:id, attr_val)

  elsif(attr == 'class')
    items = $browser.find_element(:class, attr_val)
  elsif(attr == 'xpath')
    items = $browser.find_element(:xpath, attr_val)

  end
end
