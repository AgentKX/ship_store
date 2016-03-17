class Ship < ActiveRecord::Base
def ships_list
    ships.split(', ')
  end

    def description_list
    description.split('. ')
  end

  def sale_message
    if price.to_i  < 1700
      "Discount Item"
    else 
      "On Sale"
    end
  end

  def tax
    price.to_i * 0.09
  end

  def total
    price.to_i + tax
  end

  def friendly_updated_at
    updated_at.strftime("%b %e, %l:%M %p")
  end
end

