class ApplicationController < ActionController::Base
  #before_filter :authorize_admin
  protect_from_forgery
  before_filter :initialize_cart


   helper_method :t1
   helper_method :t2

     helper_method :pp

   def pp
   		price = product.price
   		"#{price}"
   end

  def t1
  	sum = current_cart.total
    "#{sum}"
  end

  def t2
  	sum = current_cart.total_price
    "#{sum}"
  end
  
  private   	
    def current_cart
		Cart.find(session[:cart_id])
	rescue ActiveRecord::RecordNotFound
		cart = Cart.create
		session[:cart_id] = cart.id
		cart
	end

	def verify_is_admin
  (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
	end

  protected
  	  def total
	current_cart.line_items.to_a.sum { |item| item.quantity }
  end
  
  def total_price
	current_cart.line_items.to_a.sum { |item| item.total_price }
  end

  	def initialize_cart
  		Cart.find(session[:cart_id])
		rescue ActiveRecord::RecordNotFound
		cart = Cart.create
		session[:cart_id] = cart.id
		cart
  	end

 	def authorize
	  unless user_signed_in?
	  	redirect_to login_path, :method => :get, :notice => "Please login"
	  end
	end

	def authorize_admin
	  unless current_user.admin?
	  	redirect_to store_url, :notice => "You don't have the permissions."
	  end
    end

private


end
