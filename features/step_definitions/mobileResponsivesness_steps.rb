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
  #(find(element)[attribute])
  @driver = Selenium::WebDriver.for :firefox
# #  @driver.find_element(:css, element).attribute(attribute) == attribute2
#
#   el = @driver.find_element(:xpath, [@id="bs-example-navbar-collapse-1"])
#   element_class_attribute = el.attribute(attribute)
#



 # @driver.find_element(:xpath, "//*[@id='bs-example-navbar-collapse-1']")

 @driver.find_element(:css,"#bs-example-navbar-collapse-1" )

# @driver.find_element(:xpath, ("/html/body/nav/div/div[2]/[@id='bs-example-navbar-collapse-1']")).attribute(attribute) == attribute2


  # el = @driver.find_element(:xpath, "/your/xpath/here")
  # Could also your el["class"]
  #element_class_attribute = el.attribute("class")

  #find_element(:xpath, element).attribute(attribute)



end
