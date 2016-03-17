class ShipsController < ApplicationController
  def index
    @ships = Ship.all
     sort_ship = params[:sort]
    order_sort = params[:desc]
    
      if order_sort != nil
      @ships = Ship.order(sort => sort_ship)
      
      end
       render 'index.html.erb'
   end

   def discount_items
      @ships = Ship.all
      discount_ship = params [:discount]
      @ships = Ship.where("discount_ship > ?", 1300)
     end

  def show
    ship_id = params[:id]
    @ship = Ship.find_by(id: ship_id)
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    Ship.create(
      name: params[:name], 
      price: params[:price], 
      description: params[:description]
    )
    flash[:success] = "Incoming new ship!"
     redirect_to '/ships/#{ship.id}'
  end
  

  def edit
    ship_id = params[:id]
    @ship = Ship.find_by(id: ship_id)
    render 'edit.html.erb'
  end

    def update
    ship_id = params[:id]
    @ship = Ship.find_by(id: ship_id)
    @ship.update(
      name: params[:name],
      price: params[:price],
      description: params[:description]
    )
    flash[:success] = "Ship Repaired!"
    redirect_to "/ships/#{@ship.id}"

  end

  def destroy
    ship_id = params[:id]
    @ship = Ship.find_by(id: ship_id)
    @ship.destroy
    flash[:warning] = "Prepare for impact!"
    redirect_to '/ships'
  end
end
