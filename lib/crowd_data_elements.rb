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
    @elements = elements
    elements.each do |key, value|
      if (value.class.to_s == "Array" || value.class.to_s == "Hash")
        eval (%{
          def #{key}
            return @elements[:#{key}]

          end
        })
      elsif value.class.to_s == 'Fixnum'
        eval(%{
          def #{key}
            return #{value}
          end
        })
      else
        eval(%{
          def #{key}
            return #{value.dump}
          end
        })
      end
    end
  end
end