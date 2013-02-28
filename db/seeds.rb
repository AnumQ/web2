# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create(name: 'Blue Jeans', 
			   description: 'Good quality jeans', 
			   price: '29', 
			   remote_image_url: 'http://cache.theoutnet.com/images/products/210405/210405_in_xl.jpg' )

Product.create(name: 'Red Jeans', 
			   description: 'Good quality jeans', 
			   price: '29', 
			   remote_image_url: 'http://www.coggles.com/product-media/4I71/2025/2700/Levis-Made-and-Crafted-Womens-Empire-High-0114-Jester-Red-Jeans-1.jpg' )
