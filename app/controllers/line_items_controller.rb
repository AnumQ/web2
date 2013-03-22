class LineItemsController < ApplicationController
  # GET /line_items
  # GET /line_items.json
  before_filter :authorize
   skip_before_filter :authorize, :only => [ :create, :remove_item, :insert_item, :destroy ]
  def index
  		@title = "Listing all Line Items"
    @line_items = LineItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @line_items }
    end
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  	@title = "Show Line Item"
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/new
  # GET /line_items/new.json
  def new
  	@title = "Create new Line"
    @line_item = LineItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/1/edit
  def edit
  	@title = "Edit Line"
    @line_item = LineItem.find(params[:id])
  end

  # POST /line_items
  # POST /line_items.json
  def create
  	@cart = current_cart
  	product = Product.find(params[:product_id])
  	@product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)
#{@user.name}
    respond_to do |format|
      if @line_item.save
	    format.html{ redirect_to(store_url, 
		    :notice => "#{@product.title} was added to cart.") }
        format.xml {render :xml=> @line_item, notice: 'Added item to cart.', 
			:status => :created, :location => @line_item}
      else
		format.html{render :action => "new" }
		format.xml {render :xml => @line_item.errors,
	       :status => :unprocessable_entity }
	  end
    end
  end

  def remove_item
  	@cart = current_cart
  	@line_item = LineItem.find(params[:id])
  	product = @line_item.product
    @line_item = @cart.remove_product(product.id)


    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to(display_cart_path, notice: 'Item was successfully removed.' ) }
        format.json { head :no_content }
      else
        format.html { redirect_to(display_cart_path, notice: 'Item was not removed.' )  }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end 

  def insert_item
  	@cart = current_cart
  	@line_item = LineItem.find(params[:id])
  	product = @line_item.product
    @line_item = @cart.add_product(product.id)


    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to(display_cart_path, notice: 'Quantity was successfully increased.' ) }
        format.json { head :no_content }
      else
        format.html { redirect_to(display_cart_path, notice: 'Quantity was not increased.' )  }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end 
  # PUT /line_items/1
  # PUT /line_items/1.json
  def update
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to(display_cart_path, notice: 'Product removed from the basket.' ) }
      format.json { head :no_content }
    end
  end
end
