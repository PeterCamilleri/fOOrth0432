# Really simple program # 3
# A Simple Interactive Ruby Environment
# SIRE Version 0.2.5

require 'readline'
require 'prime.rb'
require 'pp'
include Readline

class Object << BasicObject
  def classes
    begin
      klass = self
      klass = klass.class unless klass.instance_of?(Class)
      print klass
      klass = klass.superclass
      print " < " if klass
    end while klass
  end
end


puts "Welcome to SIRE Version 0.2.5"
puts "Simple Interactive Ruby Environment"
done = false

until done
  begin
    line = readline('SIRE>', true)
    result = eval line
    pp result unless result.nil?
  rescue Interrupt
    done = true
  rescue Exception => e
    puts "#{e.class} detected: #{e}"
    puts
  end
end

puts
puts "Bye bye for now!"

