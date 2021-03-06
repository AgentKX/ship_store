class Ship < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  # has_many :orders
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  has_many :carted_products
  has_many :users, through: :carted_products
  has_many :orders, through: :carted_products

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

  def friendly_updated_at
    updated_at.strftime("%b %e, %l:%M %p")
  end
  
end
