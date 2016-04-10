


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

Then /^change the icons on the map to "(.*)"/ do |pic_url|

  url_marker = $browser.find_element(:class, "marker-url")
  url_marker.clear
  url_marker.send_keys(pic_url)
  save_marker = $browser.find_element(:class, 'save-marker')
  save_marker.click
  $browser.navigate.refresh
  pic_changed = $browser.find_element(:xpath, "//*[@id='map']/div/div[1]/div[3]/div[3]/div[15]").style('img_src') == pic_url

end


Then /^change the drop pin with xpath "(.*)" loc "(.*)" to loc "(.*)" and check for a change/ do |xpath,loc1, loc2|

  pin = $browser.find_element(:xpath, xpath)
  pin2 = $browser.find_element(:xpath, "//*[@id='map']/div/div[1]/div[3]/div[3]/div[2]")
  # $browser.action.click_and_hold(pin)
  # $browser.action.move_to(pin2)
  # $browser.action.release()

  $browser.action.drag_and_drop(pin, pin2).perform




end


