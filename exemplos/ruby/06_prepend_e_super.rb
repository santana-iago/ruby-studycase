Pedido = Class.new { def finalizar = "pedido confirmado" }
module Auditoria
  def finalizar
    puts "[log] iniciando finalizacao"
    super
  end
end
Pedido.prepend(Auditoria)
puts Pedido.new.finalizar
