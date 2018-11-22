class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
      # review faite dans une réservation donnée
      # si reserv fini et si sender = user_id du resto associé : commentaire pour chef sinon pour la personne et le resto associé
    if @review.save
      redirect_to reviews_index_path(current_user)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :stars, :writter, :restaurant_id)
  end
end
