class AddImageToRecommendedFoods < ActiveRecord::Migration[6.1]
  def change
    add_column :recommended_foods, :image, :string
  end
end
