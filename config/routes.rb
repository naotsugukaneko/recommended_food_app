Rails.application.routes.draw do
  devise_for :users
  root "recommended_foods#index"
  resources :recommended_foods
end
