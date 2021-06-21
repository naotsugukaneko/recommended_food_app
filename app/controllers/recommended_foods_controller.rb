class RecommendedFoodsController < ApplicationController
  def index
    @foods = RecommendedFood.includes(:user).order(:created_at)
  end

  def new
    @recommended_food = RecommendedFood.new
  end

  def create
    recommended_food = current_user.recommended_foods.create!(food_params)
    redirect_to recommended_food
  end

  def show
    @recommended_food = RecommendedFood.find(params[:id])
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def food_params
    params.require(:recommended_food).permit(:name, :comment)
  end
end
