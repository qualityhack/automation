require 'rubygems'
require 'selenium'
require 'selenium/server_manager'
require 'test/unit/testsuite'
require 'test/unit/ui/console/testrunner'
require 'lib/crowd_flags'
require 'tests/storefront'

$flags = CrowdFlags.new(ARGV);

class ModCloth_TestSuite
  def ModCloth_TestSuite.suite
    suite = Test::Unit::TestSuite.new('Modcloth - Store Front')
    suite << Storefront::HomePageTest.suite
    suite
  end
end

$selenium = Selenium::Server.new($flags.seleniumPort, $flags.timeout)
$selenium.start
Test::Unit::UI::Console::TestRunner.run(ModCloth_TestSuite)
$selenium.stop
