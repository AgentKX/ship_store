class CartedProductsController < ApplicationController
  def create
    carted_products = CartedProduct.create(
      quantity: params[:quantity],
      ship_id: params[:ship_id],
      status: "carted",
      user_id: current_user.id
    )
    redirect_to "/carted_products/#{carted_products.id}"
  end

  def show
    if current_user
      @carted_products = CartedProduct.where("status LIKE? AND user_id = ?", "carted", current_user.id)
      render "show.html.erb"
    else redirect_to '/users/sign_in'
    end
  end
end