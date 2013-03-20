class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :email_regexp =>  /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
  :fullname, :address1, :address2, :address3, :postcode, :city, :phone, :country, :admin

  validates_presence_of :fullname, :address1, :address2, :postcode, :city, :country

  # attr_accessible :title, :body

  def total_price
  	@cart = current_cart
	@cart.line_items.to_a.sum { |item| item.total_price }
  end

  def total
  	@cart = current_cart
	@cart.line_items.to_a.sum { |item| item.quantity }
  end
end
