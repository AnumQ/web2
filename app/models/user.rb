class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :firstName, :secondName, :addressLine1, :addressLine2,
					:postCode, :city, :country, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  has_many :orders
end
