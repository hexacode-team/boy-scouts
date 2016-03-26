
When /^the browser width is (.*)px/ do |width|
  # make the page width " 320 "

  # page.driver.browser.manage().window.resize_to(width,1080)
  # capybara.page.driver.resize("1300","1240")

  if Capybara.current_driver == :selenium
    window = Capybara.current_session.driver.browser.manage.window
    window.resize_to(width, 1080)
  end
end


Then /^the element (.*) should have (.*) : (.*)/ do |element, attribute, attribute2|
  find(element)[attribute] == attribute2


end