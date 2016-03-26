
When /^the browser width is (.*)px/ do |width|
  # make the page width " 320 "

  page.driver.browser.manage.window.resize_to(width,1080)

end


Then /^the element (.*) should have (.*) : (.*)/ do |element, attribute, attribute2|
  find(element)[attribute] == attribute2


end