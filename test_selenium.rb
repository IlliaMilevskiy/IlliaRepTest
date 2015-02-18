require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox
driver.get 'http://demo.redmine.org'

driver.find_element(class: 'register').click
driver.find_element(id: 'user_login').send_keys 'IlliaTestLogin7'
driver.find_element(id: 'user_password').send_keys 'IlliaTestPassword7'
driver.find_element(id: 'user_password_confirmation').send_keys 'IlliaTestPassword7'
driver.find_element(id: 'user_firstname').send_keys 'qwerqwer7'
driver.find_element(id: 'user_lastname').send_keys 'qwerqwer7'
driver.find_element(id: 'user_mail').send_keys 'qwerqwe234r@wq8er.we'
driver.find_element(name: 'commit').click

driver.find_element(class: 'logout').click
driver.find_element(class: 'login').click
driver.find_element(id: 'username').send_keys 'IlliaTestLogin7'
driver.find_element(id: 'password').send_keys 'IlliaTestPassword7'
driver.find_element(name: 'login').click

driver.find_element(class: 'my-account').click
driver.find_element(:xpath,".//*[@id='content']/div[1]/a").click
driver.find_element(id: 'password').send_keys 'IlliaTestPassword7'
driver.find_element(id: 'new_password').send_keys '123asdQ'
driver.find_element(id: 'new_password_confirmation').send_keys '123asdQ'
driver.find_element(name: 'commit').click

driver.find_element(class: 'projects').click
driver.find_element(:xpath,".//*[@id='content']/div[1]/a[1]").click
driver.find_element(id: 'project_name').send_keys 'illiatestProname7'
driver.find_element(name: 'commit').click

driver.find_element(id: 'project_quick_jump_box').click
driver.find_element(:xpath,".//*[@id='project_quick_jump_box']/option[3]").click
driver.find_element(class: 'settings').click
driver.find_element(id: 'tab-members').click
driver.find_element(id: 'principal_search').click


driver.find_element(class: 'projects').click
driver.find_element(name: 'commit').click
fail 'Expected message did not meet' unless driver.find_element(id: 'flash_notice').text == 'Your account has been activated. You can now log in.asdf'

