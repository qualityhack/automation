#Crowd Interactive Copyright 2009

module Storefrontpages

  class LoginPage < PageBase
  
    def initialize(browser)
      super(browser)
    end
  
    def usernameInput
      browser.text_field(:id, @elements.user_name_input)
    end
  
    def passwordInput
      browser.text_field(:id, @elements.password_input)
    end
  
    def loginBtn
      browser.button(:xpath, @elements.login_button)
    end
    
    def logoutBtn
      browser.button(:xpath, @elements.logout_button)
    end
  
  end

end