class Product < ActiveRecord::Base

  default_scope :order => 'title'
  attr_accessible :description, :image_url, :price, :title

  has_many :line_items
  has_many :orders, :through => :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  def total
	line_items.to_a.sum { |item| item.quantity }
  end
  def total_price
	line_items.to_a.sum { |item| item.total_price }
  end

  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['title LIKE ? OR description LIKE ?', search_condition, search_condition])
  end
	
  private
#ensurethatthereareno lineitemsreferencingthisproduct
	def ensure_not_referenced_by_any_line_item
	  if line_items.empty?
		return true
	  else
		errors.add(:base, 'Line Items present')
        return false
      end
    end
end
