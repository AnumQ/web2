class Order < ActiveRecord::Base
  attr_accessible :pay_type, :status

  has_many :line_items, :dependent => :destroy
  belongs_to :user

  PAYMENT_TYPES =[ "Check", "Creditcard", "Purchaseorder" ]
  STATUS_TYPES = [ "Created", "Pending", "Approved" ]
 # validates :pay_type, :presence => true
  #validates :pay_type, :inclusion => PAYMENT_TYPES

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
	  item.cart_id = nil
	  line_items << item
	end
  end

  def total_price
	line_items.to_a.sum { |item| item.total_price }
  end

    def total
	line_items.to_a.sum { |item| item.quantity }
  end
end
