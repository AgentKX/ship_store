class CartedProductsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @carted_products = current_user.carted_products.where(status: 'carted')
    if @carted_products.length == 0
      flash[:warning] = "You don't have any items in your cart!"
      redirect_to "/"
    else
      render 'index.html.erb'
    end
  end

  def create
    carted_products = CartedProduct.create(
      user_id: current_user.id,
      quantity: params[:quantity],
      ship_id: params[:ship_id],
      status: "carted"
    )
    redirect_to "/carted_products/"
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.update(status: "removed")
    flash[:success] = "Product successfully removed!"
    redirect_to "/carted_products"
  end
end