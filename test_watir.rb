require 'watir-webdriver'
require_relative 'test_module'

include TestModule


@browser = open_browser(:firefox)
open_home_page
login = 'a112sasd253245'
register_as(login)
logged_in_as?(login)
go_to_projects
create_new_project('test_project' + login)
project_created_successfully?
