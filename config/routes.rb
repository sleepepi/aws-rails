Rails.application.routes.draw do
  root "welcome_page#welcome"
  get "welcome_page/welcome"

  resources :items do
    member do
      get :download
    end
  end

  devise_for :users
end
