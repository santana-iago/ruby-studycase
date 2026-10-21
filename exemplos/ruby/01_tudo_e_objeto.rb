numero = 7
puts numero.class
puts numero.+(5)
puts numero.method(:+).call(5)
puts true.class
puts nil.class
puts String.class
puts :ruby.class
puts numero.respond_to?(:times)
