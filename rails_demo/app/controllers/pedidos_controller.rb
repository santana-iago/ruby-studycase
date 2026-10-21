class PedidosController < ApplicationController
  def index
    render json: Pedido.order(:id)
  end

  def create
    pedido = Pedido.new(params.require(:pedido).permit(:cliente, :total))
    if pedido.save
      render json: pedido, status: :created
    else
      render json: { erros: pedido.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
