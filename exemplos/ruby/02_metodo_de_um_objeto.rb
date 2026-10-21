perfil = Object.new
def perfil.apresentar = "Sou um objeto com metodo proprio"
outro = Object.new
puts perfil.apresentar
puts perfil.singleton_methods.inspect
puts outro.respond_to?(:apresentar)
puts perfil.singleton_class.superclass
