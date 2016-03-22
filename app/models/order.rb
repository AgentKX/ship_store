class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :ship

  def friendly_updated_at
    updated_at.strftime("%b %e, %l:%M %p")
  end
end

