#Crowd Interactive Copyright 2009
require 'rubygems'
require 'selenium'

module Storefrontpages

  # @author Edwin Cruz (edwin.cruz@crowdint.com)
  class TopMenu < PageBase

    def initialize(browser)
      super(browser)
    end
    
    def signin_link
      browser.link(:text, @elements.signIn)
    end
    
    def shop_link
      browser.link(:id, @elements.shop)
    end
  end
end