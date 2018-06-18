Rails.application.routes.draw do
  resources :items
  get 'welcome_page/welcome'
  root 'welcome_page#welcome'
end
