require 'rubygems'
require 'selenium'
require 'selenium/server_manager'
require 'test/unit/testsuite'
require 'test/unit/ui/console/testrunner'
require 'lib/crowd_flags'
require 'tests/storefront'

$flags = CrowdFlags.new(ARGV);

class CrowdPortal_TestSuite
  def CrowdPortal_TestSuite.suite
    suite = Test::Unit::TestSuite.new('CrowdPortal - Store Front')
    suite << Storefront::HomePageTest.suite
    suite
  end
end

$selenium = Selenium::Server.new($flags.seleniumPort, $flags.timeout)
$selenium.start
Test::Unit::UI::Console::TestRunner.run(CrowdPortal_TestSuite)
$selenium.stop
