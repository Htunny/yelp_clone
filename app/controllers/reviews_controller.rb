class ReviewsController < ApplicationController
    before_action :authenticate_user!, :except => [:index, :show]

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant.reviews.create(review_params)
    redirect_to '/restaurants'
  end

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end
end
