class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :photo
  
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
