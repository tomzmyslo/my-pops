Rails.application.routes.draw do
  resources :pops

  root 'home#index'
end
