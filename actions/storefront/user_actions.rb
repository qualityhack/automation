#Crowd Interactive
require 'lib/crowd_data_elements'
require 'pages/storefrontpages/login_page'
##
# This module should have all comun methods for all tests
##

module UserActions

  def login_user(webpage,username,password)
    login_page = Storefrontpages::LoginPage.new(webpage)
    login_page.usernameInput.enter(username)
    login_page.passwordInput.enter(password)
    login_page.loginBtn.click
    sleep(10)
  end

  def logout_user(webpage)
    login_page = Storefrontpages::LoginPage.new(webpage)
    login_page.logoutBtn.click
    login_page.wait_page_load
  end

end