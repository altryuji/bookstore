Rails.application.routes.draw do
  resources :shops, only: [:index, :show]
  resources :books, only: [:index] do
    collection do
      get :with_quantity
    end
  end

  root to: "books#index"
end
