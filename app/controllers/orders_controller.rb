class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  before_filter :authorize
  before_filter :authorize_admin, :only => [ :index, :destroy ]
  def index
    @orders = Order.all
    @line_items = LineItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
  	@current_user = current_user
  	@cart = current_cart
	if @cart.line_items.empty?
	  redirect_to store_url, :notice => "Your cart is empty"
	  return
	end
    
    @order = Order.new
    #@current_user = User.find(params[:current_user])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])
	@order.user_id = current_user.id
    @order.add_line_items_from_cart(current_cart)
    #@current_user = User.find(params[:current_user])

    respond_to do |format|
      if @order.save
      	Cart.destroy(session[:cart_id])
		session[:cart_id] = nil
        
        format.html{redirect_to(store_url,:notice =>
		  'Thank you for your order.')}
        format.xml {render :xml=> @order, :status => :created, :location => @order } 
      else
        format.html { render action: "new" }
        format.xml { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end
