class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  validates :quantity, presence: true 

  def valor_total
  	quantity.to_i * unit_price
  end
end
