class CartedProductsController < ApplicationController
  def create
    carted_products = CartedProduct.create(
      quantity: params[:quantity],
      ship_id: params[:ship_id],
      user_id: current_user.id
    )
    redirect_to "/carted_products/#{carted_products.id}"
  end

  def show
    @carted_product = CartedProduct.find_by(id: params[:id])
    render "show.html.erb"
  end
end
