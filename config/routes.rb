Rails.application.routes.draw do
  root to: "jewels#index"
  devise_for :users
  resources :users, only: [:index, :show]
  resources :jewels do
    resources :reviews
  end
end
