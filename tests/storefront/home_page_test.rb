# Crowd Interactive Copyright 2009

require 'tests/base_test'
require 'pages/storefrontpages/home_page'
require 'pages/storefrontpages/top_menu'
require 'pages/storefrontpages/login_page'

module Storefront
  
  ##
   # Home Page Tests
   # @author Edwin Cruz (edwin.cruz@crowdint.com)
   ##
  class HomePageTest < BaseTest
  
    ##
     # Test for Home page
     ##
    def test_home_page
      @testData = @data['test_home_page']
      homePage = Storefrontpages::HomePage.new(@webpage)
      topMenu = Storefrontpages::TopMenu.new(@webpage)
      loginPage = Storefrontpages::LoginPage.new(@webpage)

      assert true, homePage.present?
      topMenu.signin_link.click
      assert true, topMenu.present?
      loginPage.wait_page_load
      loginPage.emailInput.enter(@testData.email)
      loginPage.pwdInput.enter(@testData.pwd)
      loginPage.loginBtn.click
      homePage.wait_page_load
    end
  end

end