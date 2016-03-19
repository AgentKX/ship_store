class Ship < ActiveRecord::Base

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

