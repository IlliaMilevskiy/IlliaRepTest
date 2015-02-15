require 'watir-webdriver'

browser = Watir::Browser.new :firefox
browser.goto 'http://demo.redmine.org'
browser.link(class: 'register').click
browser.text_field(id:'user_login').set('12qwer')
browser.text_field(id:'user_password').set('qwerty')
browser.text_field(id:'user_password_confirmation').set('qwerty')
browser.text_field(id:'user_firstname').set('first name')
browser.text_field(id:'user_lastname').set('last name')
browser.text_field(id:'user_mail').set('12qwer@mailinator.com')
browser.button(value:'Submit').click

fail unless browser.link(class:'user').text.include? '12qwer'

browser.link(class:'projects').click
browser.link(class:'icon-add').click

browser.text_field(id:'project_name').set 'first test project'
browser.text_field(id:'project_identifier').set 'first-test-project123'
browser.button(value:'Create').click

fail unless browser.div(id:'flash_notice').text.include? 'Successful creation'




