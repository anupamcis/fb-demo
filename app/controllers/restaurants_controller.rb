class RestaurantsController < ApplicationController
    before_action :set_restaurant,only: [:show,:update,:destroy]

    def index
        @restaurants = Restaurant.all
        render json: @restaurants
    end

    def show
        render json:@restaurant
    end

    def create
    end

    def update
    end

    def destroy
    end

    private

    def set_restaurant
        @restaurant=Restaurant.find(params[:id])
    end

    def restaurant_params
        params.require(:data).require(:attributes).permit(:name,:description,:restaurant_type)
    end
end
