class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: %i[chef show]

  def index
    @restaurants = Restaurant.all
  end

  def show; end

  def new
    @restaurant = Restaurant.new
  end

  def chef
    @chef_name = @restaurant.chef_name
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def top
    @restaurants = Restaurant.where(stars: 5)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end

# validates :name, presence: true
# validates :address, presence: true
# validates :phone_number, presence: true
# validates :category, presence: true
# validates :category, inclusion: %w[chinese italian japanese french belgian]
