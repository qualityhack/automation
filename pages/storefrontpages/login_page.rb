#Crowd Interactive Copyright 2009

module Storefrontpages

  class LoginPage < PageBase
  
    def initialize(browser)
      super(browser)
    end
  
    def emailInput
      browser.text_field(:id, @elements.emailInput)
    end
  
    def pwdInput
      browser.text_field(:id, @elements.pwdInput)
    end
  
    def loginBtn
      browser.button(:xpath, @elements.submitButton)
    end
  
  end

end