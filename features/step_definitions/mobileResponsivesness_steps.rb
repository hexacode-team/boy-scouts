
#driver to run test in firefox
browser = Selenium::WebDriver.for :firefox


When /^the browser width is greater than or equal to (.*)px/ do |width|

    browser.manage.window.resize_to(width, 1080)
    browser.navigate.to('http://0.0.0.0:3000/')
end


Then /^the element with (.*) "(.*)" should have (.*) : (.*)/ do |attr, attr_val, prop, prop_val|

  if(attr == 'id')
    items = browser.find_element(:id, attr_val).style(prop) == prop_val

  elsif(attr == 'class')
    items = browser.find_element(:class, attr_val).style(prop) == prop_val

  end
end
