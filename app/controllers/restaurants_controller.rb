class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all.order(:state)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = 'Restaurant has been saved!'
      redirect_to restaurant_path(@restaurant)
    else
      flash[:notice] = 'Please fill in a name and address'
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews
  end

  protected
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :state, :zipcode, :description, :category)
  end
end
