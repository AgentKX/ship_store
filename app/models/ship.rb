class Ship < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :categorized_products
  has_many :categories, through: :categorized_products

  def sale_message
    if price < 2000
      "Discount Item"
    
    else 
      "On Sale"
    end
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

def printable_category_names
  names = []
  categories.each do |caterory|
  names << category.name
end

names.join(", ")
end

  def friendly_updated_at
    updated_at.strftime("%b %e, %l:%M %p")
  end
  
end

