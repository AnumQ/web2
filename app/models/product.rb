class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :image, :remote_image_url#, :photo

  #validates_attachment_presence :photo
  #validates_attachment_content_type :photo, :content_type => ['image/jpg', 'image/jpeg', 'image/png']

  validates_uniqueness_of :name
  validates_length_of :name, :in => 1..255 
  validates_numericality_of :price
  
  #has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100#" },
  #					:url  => "/assets/products/:id/:style/:basename.:extension",
   #                 :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
 
   mount_uploader :image, ImageUploader
end
