Rails.application.routes.draw do
  root to: "jewels#index"
  devise_for :users
  resources :users, only: [:index, :show]
  resources :jewels do
    resources :reviews, except: [:index, :show]
  end

  match('/reviews/:id/upvotes', {:via => :post, :to => 'upvotes#create', as: :review_upvotes})
  match('/reviews/:id/downvotes', {:via => :post, :to => 'downvotes#create', as: :review_downvotes})
end
