class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_reviews

  def index

  end

  def create
    if @reviews.map{ |t| t[:writter_id] }.include?(current_user.id)
      @reviews.find{ |t| t[:writter_id] = current_user.id }.update(review_params)
    else
      @review = Review.new(review_params)
      @review.restaurant = Restaurant.find(params[:restaurant_id])
      @review.writter = current_user
      @review.save
    end
    redirect_to restaurant_path(@restaurant)
      # review faite dans une réservation donnée
      # si reserv fini et si sender = user_id du resto associé : commentaire pour chef sinon pour la personne et le resto associé
  end

  private

  def set_reviews
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews
  end

  def review_params
    params.require(:review).permit(:description, :stars, :writter_id, :restaurant_id)
  end
end
