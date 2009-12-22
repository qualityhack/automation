# Crowd Interactive Copyright 2009
require 'lib/crowd_data_elements'

##
 # Loads Test Data or Elements XPaths
 # @author Edwin Cruz (edwin.cruz@crowdint.com)
 ##
class LoadData

  ##
   # Loads test data based on test name.
   # @params name string filename to load data
   # @params path base path to find '/data/' folder
   # @returns associative array containing at method level its test data
   ##
  def self.loadTestData(name, path)
    realPath = self.getRealPath(name, '/data/')
    data = YAML::load(File.read(path + '/' + realPath + '.yaml'))
    tmp = {}
    data.each do |key, values|
      tmp[key] = CrowdDataElements.new(values)
    end
    tmp
  end

  ##
   # Loads xpath elements based on page name.
   # @params name string filename to load data
   # @params path base path to find '/elements/' folder
   # @returns associative array containing element's xpath
   ##
  def self.loadXPathElements(name, path)
    realPath = self.getRealPath(name, '/elements/')
    data = YAML::load(File.read(path + '/' + realPath + '.yaml'))
    CrowdDataElements.new(data)
  end
  
  def self.getRealPath(name, glue)
    params = name.split('::')
    params[0] = params[0].downcase
    realPath = params.join(glue)
    realPath
  end
end