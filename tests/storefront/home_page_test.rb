# Crowd Interactive Copyright 2009

require 'tests/base_test'
require 'pages/storefrontpages/home_page'
require 'pages/storefrontpages/login_page'
require 'actions/storefront/user_actions'

module Storefront
  
  ##
   # Home Page Tests
   # @author Edwin Cruz (edwin.cruz@crowdint.com)
   ##
  class HomePageTest < BaseTest
    include UserActions
    ##
     # Test for Home page
     ##
    def test_home_page

      @testData = @data['test_home_page']
      login_user(@webpage,@testData.username,@testData.password)
      
    end
  end

end