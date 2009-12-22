#Crowd Interactive Copyright 2009

# @author Edwin Cruz (edwin.cruz@crowdint.com)
class Flag
  def initialize(name, default, hint)
    @name = name
    @value = default
    @hint = hint
  end
  
  def set_value(value)
    @value = value
  end

  def value()
    @value
  end

  def get_usage()
    "  --#{@name}: #{@hint}, default value: #{@value}"
  end
end