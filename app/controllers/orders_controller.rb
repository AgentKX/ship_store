class OrdersController < ApplicationController
  def create
    @ship = Ship.find_by(id: params[:ship_id])
    subtotal = @ship.price.to_i * params[:quantity].to_i
    tax = @ship.tax.to_i * params[:quantity].to_i
    total = @ship.total.to_i * params[:quantity].to_i

    order = Order.create(
    quantity: params[:quantity],
    ship_id: params[:ship_id],
    user_id: current_user.id,
    subtotal: subtotal,
    tax: tax,
    total: total

    )
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    render "show.html.erb"
  end
end
