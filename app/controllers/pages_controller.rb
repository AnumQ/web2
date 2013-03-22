class PagesController < ApplicationController
	layout 'pages'
  def home
  		@title = "Home Us"
  end
  
  def about
  		@title = "About Us"
  end
  
  def contact
  	@title = "Contact Us"
  end
  
  def help
  	@title = "Help"
  end

end
