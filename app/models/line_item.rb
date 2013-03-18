class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id, :product, :quantity

  belongs_to :order
  belongs_to :product
  belongs_to :cart


  def total_price
	product.price*quantity
  end

  def total
	line_items.to_a.sum { |item| item.quantity }
  end


end
