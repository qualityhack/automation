require 'rubygems'
require 'rake'
require 'selenium'
require 'selenium/server_manager'
require 'spec/rake/spectask'

manager = Selenium::ServerManager.new(Selenium::SeleniumServer.new)

task :default => :acceptance_cycle

task :start_server do
  manager.start
end

task :stop_server do
  manager.stop
end

Spec::Rake::SpecTask.new('crowdportal_storefront_tests') do |t|
  t.spec_files = FileList['tests/storefront/*.rb']
end

task :acceptance_cycle do
  print "Here"
  begin
    Rake::Task['start_server'].invoke
    Rake::Task['crowdportal_storefront_tests'].invoke
  ensure
    Rake::Task['stop_server'].invoke
  end
end