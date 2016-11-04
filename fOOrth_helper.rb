#Helper code for the fOOrth language system

#Extensions to the Object class required by the fOOth language system.
class Object
  #Convert this object to a fOOrth boolean.
  def to_fOOrth_b
    self
  end
  
  #Convert this object to a single character string.
  def to_fOOrth_c
    "\x00"
  end
  
  alias :read_var  :instance_variable_get
  alias :write_var :instance_variable_set
end

#Extensions to the Numeric class required by the fOOth language system.
class Numeric
  #Convert this number to a form suitable for embedding in a lambda 
  #as a literal.
  #==== Returns
  #* An embeddable form of this number as a string.
  def embed
    self.to_s
  end
  
  #Convert this number to a fOOrth boolean.
  def to_fOOrth_b
    self != 0
  end
  
  #Convert this number to a single character string.
  def to_fOOrth_c
    self.to_i.chr
  end
end

#Extensions to the Rational class required by the fOOth language system.
class Rational
  #Convert this rational number to a form suitable for embedding in a 
  #lambda as a literal.
  #==== Returns
  #* An embeddable form of this rational number as a string.
  def embed
    "'#{self.to_s}'.to_r"
  end
end

#Extensions to the String class required by the fOOth language system.
class String
  #Convert this string to a form suitable for embedding in a lambda as 
  #a literal.
  #==== Returns
  #* An embeddable form of this string as a string.
  #==== Note:
  #The strings involved go through several layers of quote processing. 
  #The resulting code is most entertaining!
  def embed
    "'#{self.gsub(/\\/, "\\\\\\\\").gsub(/'/,  "\\\\'")}'"
  end
  
  #Convert this string to a fOOrth boolean.
  def to_fOOrth_b
    self != ''
  end
  
  #Convert this string to a single character string.
  def to_fOOrth_c
    self[0]
  end

end

