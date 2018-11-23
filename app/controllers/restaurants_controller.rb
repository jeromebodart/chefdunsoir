class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  def index
    if params[:query].present?
      sql_query = " \
      restaurants.category @@ :query \
      OR restaurants.name @@ :query \
      OR restaurants.address @@ :query \
      "
      # restaurants.capacity @@ :query \
      # restaurants.longitude @@ :query \
      # restaurants.latitude @@ :query \
      @restaurants = Restaurant.where(sql_query, query: "%#{params[:query]}%")
    else
      @restaurants = Restaurant.all
    end
    @restaurants = @restaurants.where.not(latitude: nil, longitude: nil)
    @markers = @restaurants.map do |restaurant|
      {
        lng: restaurant.longitude,
        lat: restaurant.latitude,
        infoWindow: { content: render_to_string("../views/restaurants/map_window.html.erb", locals: { restaurant: restaurant }) }
        # infoWindow: { content: "<h1>#{restaurant.name}</h1>" }

      }
    end
  end

  def show
    @reservation = Reservation.new
    if user_signed_in?
      @reservations = current_user.reservations
      @review = Review.new
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.images.attach(params[:restaurant][:images])
    if user_signed_in?
      @restaurant.user_id = current_user.id
      if @restaurant.save
        redirect_to restaurant_path(@restaurant)
      else
        render :new
      end
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end
end
