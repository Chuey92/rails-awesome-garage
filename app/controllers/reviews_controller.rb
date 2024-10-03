class ReviewsController < ApplicationController
  def create
    @car = Car.find(params[:car_id])
    @review = @car.reviews.build(review_params)

    if @review.save
      redirect_to car_path(@car), notice: "Review added successfully."
    else
      redirect_to car_path(@car), alert: "Failed to add review. Please check the input."
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
