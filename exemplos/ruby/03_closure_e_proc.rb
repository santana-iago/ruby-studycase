def criar_desconto(porcentagem)
  ->(preco) { (preco * (1 - porcentagem / 100.0)).round(2) }
end
cupom = criar_desconto(25)
precos = [50, 100, 140]
puts cupom.class
puts precos.map(&cupom).inspect
puts cupom.call(80)
puts criar_desconto(10).call(80)
