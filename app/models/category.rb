class Category < ActiveRecord::Base
  has_many :categorized_products
  has_many :ships, through: :categorized_products
end
