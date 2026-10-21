require "test_helper"

class PedidoTest < ActiveSupport::TestCase
  test "frete gratis a partir de cem reais" do
    assert Pedido.new(cliente: "Ana", total: 100).frete_gratis?
    assert_not Pedido.new(cliente: "Ana", total: 99).frete_gratis?
  end

  test "pedido precisa de cliente" do
    assert_not Pedido.new(total: 120).valid?
  end
end
