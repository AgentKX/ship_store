class Order < ActiveRecord::Base
  has_many :carted_products
  has_many :users, through: :carted_products
  has_many :products, through: :carted_products

  def friendly_updated_at
    updated_at.strftime("%b %e, %l:%M %p")
  end
end

