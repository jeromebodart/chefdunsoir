class ReviewsController < ApplicationController
  def index
      @reviews = current_user.reviews
  end

  def show

    # voir les review d'un user ou d'un restaurant
  end

  def create
    @review = review.new(review_params)
    if user_signed_in?
      @review.sender = current_user.id
      # review faite dans une réservation donnée
      # si reserv fini et si sender = user_id du resto associé : commentaire pour chef sinon pour la personne et le resto associé
      if @review.save
        redirect_to reviews_index_path(current_user)
      else
        render :new
      end
    end
  end

  def new
    @review = Review.new
  end


  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:description, :stars, :chef, :reviewable, :sender)
  end
end
