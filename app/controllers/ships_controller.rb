class ShipsController < ApplicationController
  def index
    @ships = Ship.all
    sort_ship = params[:sort]
    sort_order = params[:sort_order]
    if sort_ship && sort_order
      @ships = Ship.order(sort_ship => sort_order)
    end

    if params["discount"]
      @ships = Ship.where("price < ", 2000)
    end
    
    if params[:category]
      @ships = Category.find_by(name: params[:category]).ships
    end
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

  def show
    if params[:id] == "random"
      ships = Ship.all
      @ship = ships.sample
    else
      @ship = Ship.find_by(id: params[:id])
    end
  end
  
  def edit
    ship_id = params[:id]
    @ship = Ship.find_by(id: ship_id)
    render 'edit.html.erb'
  end

  def update
    @ship = Ship.find_by(id: params[:id])
    ship_id = params[:id]
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
  
  def run_search
    search_term = params[:search]
    @ships = Ship.where("name LIKE ?", "%" + search_term + "%")
    render "index.html.erb"
  end

end



  private

  def authenticate_admin!
    unless current_user && current_user.admin
      redirect_to "/"
  end
end