Rails.application.routes.draw do
  root 'store#index', as: 'store_index'
  
  resources :orders
  resources :carts
  
  resources :line_items do
    member do
      put 'decrement'
    end
  end

  resources :products do
    get :who_bought, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
