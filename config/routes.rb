Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users
  resources :products do
    get :who_bought, on: :member
  end
  
  scope '(:locale)' do
    resources :orders
    resources :carts
    resources :line_items do
      member do
        put 'decrement'
      end
    end
    root 'store#index', as: 'store_index', via: :all
  end
end
