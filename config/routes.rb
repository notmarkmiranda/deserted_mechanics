Rails.application.routes.draw do
  root "home#index"

  get "/sign-in", to: "sessions#new", as: "sign_in"
  post "/sign-in", to: "sessions#create"
  post "/sign-out", to: "sessions#destroy", as: "sign_out"
  get "/sign-up", to: "users#new", as: "sign_up"
  post "/sign-up", to: "users#create"
  get "/dashboard", to: "users#show", as: "dashboard"

  resources :leagues, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :memberships, only: [:index, :new, :create, :edit, :update, :destroy]
    patch "/membership/:id/reactivate/", to: "memberships#reactivate", as: "membership_reactivate"
  end
end
