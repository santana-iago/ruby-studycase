evento = { tipo: :pedido, dados: { id: 42, valor: 180 } }
case evento
in { tipo: :pedido, dados: { id:, valor: (100.. => valor) } }
  puts "Pedido #{id}: frete gratis (R$ #{valor})"
in { tipo: :pedido, dados: { id: } }
  puts "Pedido #{id}: frete normal"
else
  puts "Evento nao reconhecido"
end
