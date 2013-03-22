module ApplicationHelper

  def total_price
  	@cart = current_cart
	@cart.line_items.to_a.sum { |item| item.total_price }
  end

  def total
  	@cart = current_cart
	@cart.line_items.to_a.sum { |item| item.quantity }
  end

  def full_title(page_title)                          # Method definition
    base_title = "Ring Outlet Fashion Handbags and Purses"  # Variable assignment
    if page_title.empty?                              # Boolean test
      base_title                                      # Implicit return
    else
      "#{base_title} | #{page_title}"                 # String interpolation
    end
  end

	def hidden_div_if(condition,attributes={},&block)
	  if condition
		attributes["style"]= "display: none"
	  end
	  content_tag("div",attributes,&block)
	end

end
