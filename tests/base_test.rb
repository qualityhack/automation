# Crowd Interactive Copyright 2009

require 'rubygems'
require 'selenium'
require 'test/unit'
require 'lib/load_data'

##
# Base Test Class for Crowd Automation Testing Framework
# Extend your test case from this class to get everything needed
# @author: Edwin Cruz (edwin.cruz@crowdint.com)
##
class BaseTest < Test::Unit::TestCase

  @data = {}
  ##
  # Sets up the environment to run tests, decides whether build a new selenium client
  #   or use a global one.
  #
  ##
  def setup
    @verification_errors = []
    @webpage = $selenium.open("*#{$flags.browser}", $flags.url)
    @data = LoadData::loadTestData(self.class.to_s, File.dirname(__FILE__))
  end

  ##
  # Executed after all tests, normally to stop selenium client.
  #
  ##
  def teardown
    @webpage.close
    assert_equal [], @verification_errors
  end

  ##
  # Creates a new selenium object over the existing one.
  # @params context string name
  ##
  def getOwnSelenium(context)
    selenium = Selenium::SeleniumDriver.new($flags.seleniumHost,\
        $flags.seleniumPort,\
        "*#{$flags.browser}",\
        $flags.url,\
        $flags.timeout)
    selenium.start
    selenium.set_context(context)
    selenium
  end
end