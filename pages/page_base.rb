#Crowd Interactive Copyright 2009

require 'rubygems'
require 'selenium'

# Common page actions for this framework
# @author Edwin Cruz (edwin.cruz@crowdint.com)
class PageBase < Selenium::WebPage
  @elements
  @browser

  # Default constructor
  def initialize(browser)
    @elements = LoadData::loadXPathElements(self.class.to_s, File.dirname(__FILE__))
    super(browser, @elements.title)
    @browser = browser
  end

  ## Common page actions

  # Gets body text
  def html
    @browser.html()
  end

  def title
    @browser.title
  end

  # Waits for page to load
  def wait_page_load
    @browser.wait_for_load
  end

  def go_home_page
    @browser.open_page '/store/'
    self.wait_page_load
  end
end