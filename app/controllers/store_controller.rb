class StoreController < ApplicationController
	layout 'store'
  def index
  	@title = "Feature Products"
  	@products = Product.all
  	@cart = current_cart
  end
end
