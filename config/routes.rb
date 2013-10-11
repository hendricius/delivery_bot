DeliveryBot::Application.routes.draw do
  resources :clients

  resources :drivers do
    get 'become'
  end

  resources :orders

  resources :companies

  resources :headquarters do
    member do
      post 'assign_orders'
    end
  end

  root 'static#home'
end
