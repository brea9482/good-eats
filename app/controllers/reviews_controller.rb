class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant_id = @restaurant.id
    if @review.save
      flash[:notice] = 'Your review has been saved.'
      redirect_to restaurant_path(@restaurant)
    else
      flash[:notice] = 'You must supply a description and a rating between 1 and 5.'
      render :new
    end
  end

  protected
  def review_params
    params.require(:review).permit(:rating, :description)
  end

end
