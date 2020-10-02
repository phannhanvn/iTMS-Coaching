# Bài Sign up 

Given('Sign up successful in the website') do 
    @driver = Selenium::WebDriver.for :chrome
    @driver.navigate.to('https://itmscoaching.herokuapp.com/form')
    @driver.manage.timeouts.implicit_wait = 5
    #Maximize size of browser window.
    @driver.manage.window.maximize
end

When('User in put First name is {string}, Last name is {string}, Job title is {string}, click High School {string}, click sex is Male {string}, click exp 0-2 {string} and enter 25-04-1999') do |string1, string2, string3, string4, string5, string6|
    @driver.find_element(id: 'first-name').send_keys(string1)
    @driver.find_element(id: 'last-name').send_keys(string2)
    @driver.find_element(id: 'job-title').send_keys(string3)
    @driver.find_element(id: string4).click
    @driver.find_element(id: string5).click
    @option_exp = @driver.find_element(id: 'select-menu')
    @select_exp = Selenium::WebDriver::Support::Select.new(@option_exp)
    @select_exp.select_by(:index, string6)
    @driver.find_element(id: 'datepicker').click

    @year = @driver.find_element(:xpath, "//th[contains(text(),'October 2020')]")
    @year.click
    @year = @driver.find_element(:xpath, "//div[@class='datepicker-months']//th[@class='datepicker-switch'][contains(text(),'2020')]")
    @year.click
    @year = @driver.find_element(:xpath, "//div[@class='datepicker-years']//th[@class='prev'][contains(text(),'«')]
    ")
    @year.click
    @year.click
    @year_2025 = @driver.find_element(:xpath, "//span[contains(text(),'1999')]")
    @year_2025.click
    @month_oct = @driver.find_element(:xpath, "//span[contains(text(),'Apr')]")
    @month_oct.click
    @day_27 = @driver.find_element(:xpath, "//td[contains(text(),'25')]")
    @day_27.click

    @driver.find_element(:xpath, "//a[@class='btn btn-lg btn-primary']").click
end

Then('When sign up is successful {string} result should be listed on message page') do |string|
    @driver.find_element(:xpath, "//div[@class='alert alert-success']").text.include?(string)
end

# Bai login valid
Given('login successful in the website') do 
    @driver = Selenium::WebDriver.for :chrome
    @driver.navigate.to('http://the-internet.herokuapp.com/login')
    @driver.manage.window.maximize
end


When('user input valid user is {string}') do |string|
    
    @driver.find_element(:id, 'username').send_keys(string)
end
And('valid password is {string}') do |string|
    
    @driver.find_element(:id, 'password').send_keys(string)
    @driver.find_element(:id, 'password').send_keys(:enter)
end

Then('when login is successful {string} result should be listed on message page') do |string|
    @driver.find_element(:id, 'flash').text.include?(string)
    @driver.close
end

# Bai login invalid
Given('login successful in the website') do 
    @driver = Selenium::WebDriver.for :chrome
    @driver.navigate.to('http://the-internet.herokuapp.com/login')
    @driver.manage.window.maximize
end


When('user input invalid user is {string}') do |string|
    
    @driver.find_element(:id, 'username').send_keys(string)
end
And('invalid password is {string}') do |string|
    
    @driver.find_element(:id, 'password').send_keys(string)
    @driver.find_element(:id, 'password').send_keys(:enter)
end

Then('when login is failed {string} result should be listed on message page') do |string|
    @driver.find_element(:id, 'flash').text.include?(string)
    @driver.close
end

#cucumber -f html -o report.html
