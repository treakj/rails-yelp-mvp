Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants, only: %i[index new show create] do
    collection do
      get :top
    end

    member do # esses que tem id
      get :chef
    end

    resources :reviews, only: %i[new create]
  end
end
