require 'selenium-webdriver'  #підгружаємо бібліотеку селеніуму

driver = Selenium::WebDriver.for :firefox #відкриваємо браузер,фаєрфокс
driver.get 'http://demo.redmine.org'#відкриваємо початкову сорінку

driver.find_element(class: 'register').click #знаходимо кнопку реєстрації і нажимаємо на неї
driver.find_element(id: 'user_login').send_keys 'IlliaTestLogin13'#в поле логін вводимо вказаний логін
driver.find_element(id: 'user_password').send_keys 'IlliaTestPassword13'
driver.find_element(id: 'user_password_confirmation').send_keys 'IlliaTestPassword13'
driver.find_element(id: 'user_firstname').send_keys 'qwerqwer13'
driver.find_element(id: 'user_lastname').send_keys 'qwerqwer13'
driver.find_element(id: 'user_mail').send_keys 'qwerqwe234r@wq14er.we'
driver.find_element(name: 'commit').click

driver.find_element(class: 'logout').click
driver.find_element(class: 'login').click
driver.find_element(id: 'username').send_keys 'IlliaTestLogin13'
driver.find_element(id: 'password').send_keys 'IlliaTestPassword13'
driver.find_element(name: 'login').click

driver.find_element(class: 'my-account').click
driver.find_element(:xpath,".//*[@id='content']/div[1]/a").click
driver.find_element(id: 'password').send_keys 'IlliaTestPassword13'
driver.find_element(id: 'new_password').send_keys '123asdQ'
driver.find_element(id: 'new_password_confirmation').send_keys '123asdQ'
driver.find_element(name: 'commit').click

#add member
driver.find_element(class: 'projects').click
driver.find_element(:xpath,".//*[@id='content']/div[1]/a[1]").click
driver.find_element(id: 'project_name').send_keys 'illiatestProname13'
driver.find_element(name: 'commit').click
driver.find_element(id: 'tab-members').click
driver.find_element(:xpath,".//*[@id='principal_search']").click
sleep 2
driver.find_element(:xpath,".//*[@id='principal_search']").send_keys 'qwerqwer6'
sleep 2
driver.find_element(:xpath,".//*[@id='principals']/label/input").click
sleep 2
driver.find_element(:xpath,".//*[@id='new_membership']/fieldset/p[2]/label[1]/input").click
driver.find_element(id: 'member-add-submit').click


# edit member
driver.find_element(:xpath,".//*[@id='member-90870']/td[3]/a[1]").click
driver.find_element(:xpath,".//*[@id='member-90870-roles-form']/p[1]/label[3]/input").click
driver.find_element(:xpath,".//*[@id='member-90870-roles-form']/p[2]/input").click

#add version
driver.find_element(id: 'tab-versions').click
driver.find_element(:xpath,".//*[@id='tab-content-versions']/p[2]/a").click
driver.find_element(id: 'version_name').send_keys 'NewTestVersion'
driver.find_element(:xpath,".//*[@id='new_version']/input").click

#3 types of issue
driver.find_element(id: 'tab-categories').click
driver.find_element(:xpath,".//*[@id='tab-content-categories']/p[2]/a").click
driver.find_element(id: 'issue_category_name').send_keys '1issue'
driver.find_element(name: 'commit').click
driver.find_element(:xpath,".//*[@id='tab-content-categories']/p[2]/a").click
driver.find_element(id: 'issue_category_name').send_keys '2issue'
driver.find_element(name: 'commit').click
driver.find_element(:xpath,".//*[@id='tab-content-categories']/p[2]/a").click
driver.find_element(id: 'issue_category_name').send_keys '3issue'
driver.find_element(name: 'commit').click

fail 'Expected message did not meet' unless driver.find_element(:xpath,".//*[@id='tab-content-categories']/table/tbody/tr[3]/td[1]").text == '1issue'
fail 'Expected message did not meet' unless driver.find_element(:xpath,".//*[@id='tab-content-categories']/table/tbody/tr[1]/td[1]").text == '2issue'
fail 'Expected message did not meet' unless driver.find_element(:xpath,".//*[@id='tab-content-categories']/table/tbody/tr[2]/td[1]").text == '3issue'
