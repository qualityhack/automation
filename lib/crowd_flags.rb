#Crowd Interactive Copyright 2009
require 'lib/flag'

# Flags Parser
# @author Edwin Cruz (edwin.cruz@crowdint.com)
class CrowdFlags

  # Used in Reflection technique
  attr_reader :flags

  #Store Framework flags
  @flags = nil

  ##
   # Parses arguments from command line.
   # @params args array with command line options
   ##
  def initialize(args)
    yamlFlags = YAML::load(File.read('config/flags.yaml'))
    @flags = {}
    yamlFlags.each do |key, flag|
      @flags[key] = Flag.new(key, flag['value'], flag['hint'])
      eval (%{
          def #{key} 
            return @flags['#{key}'].value()
          end 
        })
    end
    args.each do |arg|
      unless !/^(\-\-)+[a-zA-Z0-9_\-]+(=+[a-zA-Z0-9_\-:\/\.]+)*$/.match(arg).nil?
        show_usage(arg)
      end
      param = arg.split("=")
      if (param[0] == '--help')
        show_usage(nil)
      end
      @flags[param[0].sub('--', '')].set_value(param[1])
    end
  end

  ##
   # If --help is argumented show usage or wrong argument.
   # @params arg string wrong argument given
   ##
  def show_usage(arg)
    puts "Argument #{arg} not recognized, avaiable options:" if !arg.nil?
    @flags.each do |key, flag|
      puts "#{flag.get_usage()}"
    end
    Process.exit
  end
end