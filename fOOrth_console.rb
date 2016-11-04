#==== fOOrth_console.rb
#The fOOrth console support file.
#This file provides for the entry of fOOrth instructions from the console.
module XfOOrth
  require 'readline'
  
  #The console class enables the use of the command line console as a source
  #for fOOrth commands and source code. The readline facility is used to enable
  #editing and command history and retrieval.
  class Console
    include Readline
    include ReadPoint
  
    #Initialize a new console command source.  
    def initialize
      reset_read_point
    end
    
    #Discard any unused input and resume.
    def flush
      reset_read_point
    end
    
    #Get the next character of command text from the user.
    #==== Returns
    #The next line of user input as a string.
    def get
      read { puts; readline(prompt, true).rstrip }
    end  

    #Has the scanning of the text reached the end of input?
    #==== Returns
    #Always returns false.
    def eof?
      false
    end
    
    #Build the command prompt for the user based on the state 
    #of the virtual machine.
    #==== Returns
    #A prompt string.
    def prompt
      vm = Thread.current[:vm]
      '>' * vm.level + '"' * vm.quotes
    end
  end  
end
