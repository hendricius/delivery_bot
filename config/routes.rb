DeliveryBot::Application.routes.draw do
  resources :drivers

  resources :orders

  resources :companies

  resources :headquarters

  root 'static#home'
end
