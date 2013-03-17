class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
  :fullname, :address1, :address2, :address3, :postcode, :city, :country, :phone, :admin

  validates_presence_of :fullname, :address1, :address2, :postcode, :city, :country

  # attr_accessible :title, :body
end
