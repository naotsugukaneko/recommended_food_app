class RecommendedFoodsController < ApplicationController
  before_action :set_food, only: %i[edit update destroy]

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

  def destroy
    @recommended_food.destroy
    redirect_to root_path
  end

  private

  def food_params
    params.require(:recommended_food).permit(:name, :comment)
  end

  def set_food
    @recommended_food = current_user.recommended_foods.find_by(id: params[:id])
    redirect_to root_path, alert: "権限がありません" if @recommended_food.nil?
  end
end
