class Pedido < ApplicationRecord
  validates :cliente, presence: true
  validates :total, numericality: { greater_than_or_equal_to: 0 }
  scope :com_frete_gratis, -> { where("total >= ?", 100) }

  def frete_gratis?
    total >= 100
  end
end
