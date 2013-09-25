DeliveryBot::Application.routes.draw do
  resources :clients

  resources :drivers do
    get 'become'
  end

  resources :orders

  resources :companies

  resources :headquarters

  root 'static#home'
end
