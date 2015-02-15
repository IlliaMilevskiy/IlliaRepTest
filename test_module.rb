module TestModule
  def open_browser(browser)
    @browser = Watir::Browser.new browser
  end


  def open_home_page
    @browser.goto 'http://demo.redmine.org'
  end


  def register_as(name)
    @browser.link(class: 'register').click
    @browser.text_field(id: 'user_login').set(name)
    @browser.text_field(id: 'user_password').set('qwerty')
    @browser.text_field(id: 'user_password_confirmation').set('qwerty')
    @browser.text_field(id: 'user_firstname').set('first name')
    @browser.text_field(id: 'user_lastname').set('last name')
    @browser.text_field(id: 'user_mail').set(name + '@mailinator.com')
    @browser.button(value: 'Submit').click
  end


  def logged_in_as?(login)
    fail unless @browser.link(class: 'user').text.include? login
  end


  def go_to_projects
    @browser.link(class: 'projects').click
  end

  def create_new_project(name)
    @browser.link(class: 'icon-add').click

    @browser.text_field(id: 'project_name').set name
    @browser.text_field(id: 'project_identifier').set name
    @browser.button(value: 'Create').click
  end


  def project_created_successfully?
    fail unless @browser.div(id: 'flash_notice').text.include? 'Successful creation'
  end
end