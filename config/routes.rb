Rails.application.routes.draw do
  root "home#index"

  get "/sign-in", to: "sessions#new", as: "sign_in"
  post "/sign-in", to: "sessions#create"
  post "/sign-out", to: "sessions#destroy", as: "sign_out"

  get "/sign-up", to: "users#new", as: "sign_up"
  post "/sign-up", to: "users#create"
  get "/dashboard", to: "users#show", as: "dashboard"
  get "/invite/:token", to: "users#reset", as: "membership_invite"
  get "/reset/:token", to: "users#reset", as: "reset_password"
  get "/forgot-your-password", to: "users#forgot", as: "forgot_password"
  post "/reset", to: "users#send_reset", as: "send_reset"
  get "/reset-sent", to: "users#reset_sent", as: "reset_sent"

  resources :users, only: [:update]

  resources :leagues, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :memberships, only: [:index, :new, :create, :edit, :update, :destroy]
    patch "/membership/:id/reactivate/", to: "memberships#reactivate", as: "membership_reactivate"
  end
end
