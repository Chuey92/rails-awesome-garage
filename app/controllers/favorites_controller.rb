class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all
  end

  def create
    @car = Car.find(params[:car_id])
    @favorite = @car.favorites.build

    if @favorite.save
      redirect_to @car, notice: "Car added to garage."
    else
      redirect_to @car, alert: "Failed to add car to garage."
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy

    redirect_to favorites_path, notice: "Car removed from garage."
  end
end
