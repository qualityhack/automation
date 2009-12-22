#Crowd Interactive Copyright 2009

##
 # Reflection class to transform hashes to objects
 # @author Edwin Cruz (edwin.cruz@crowdint.com)
 ##
class CrowdDataElements

  ##
   # Builds magic functions to handle elements
   # @params hash key => value
   ##
  def initialize(elements)
    elements.each do |key, value|
      eval (%{
        def #{key}
          return #{value.dump}
        end
      })
    end
  end
end