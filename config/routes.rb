Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

  root to: "customer/homes#top"
  
  get "/homes/about" => "customer/homes#about"
  get "/homes/thanks" => "customer/homes#thanks"
  
  namespace :customer do
  
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:create, :index, :destroy]
    resources :orders, only: [:new, :create, :index, :show]
    resources :addresses, only: [:index, :create, :destroy, :edit, :update]
    resource :customers, only: [:show, :destroy, :edit, :update]
    put "/customers/:id/hide" => "customers#hide", as: 'customers_hide'
    
    delete "/cart_items" => "cart_items#destroy_all"
    get  "/cart_items/confirm" => "cart_items#confirm"
    get  "/customers/confirm" => "customers#confirm"
    
  end
  
  namespace :admin do

    resources :items, only: [:index, :new, :create, :show, :edit, :update]  
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_items, only: [:update]
  
  end

end
