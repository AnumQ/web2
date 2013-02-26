class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :photo
  
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
 
  validates_uniqueness_of :name
  validates_length_of :name, :in => 1..255 
  validates_numericality_of :price
end
