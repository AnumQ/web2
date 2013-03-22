class StoreController < ApplicationController
	layout 'store'
  def index
  	@title = "Feature Products"
  	@products = Product.all
  	@cart = current_cart
  end


  def search
  	@title = "Listing Results"
    @products = Product.search params[:q]
        respond_to do |format|
      format.html { redirect_to(store_search_url)}
      format.json { render json: @products }
    end
  end
end