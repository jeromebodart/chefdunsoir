class Profile::RestaurantsController < ApplicationController
  def index
    @restaurants = current_user.restaurants
  end
end
