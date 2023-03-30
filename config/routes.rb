Rails.application.routes.draw do
  namespace :admin do
    resources :order_details, only: [:update]
    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, except: [:destroy]
  end
  get 'admin' => 'admin/homes#top', as:'top'

  scope module: :public do
    resources :addresses, except: [:new, :show]

    resources :orders, only: [:new, :create, :index, :show]
    post 'orders/confirm'
    get 'orders/complete'

    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete 'cart_items/destroy_all'

    get 'customers/my_page' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'

    resources :items, only: [:index, :show]

    root to: 'homes#top'
    get 'about' => 'homes#about', as:'about'
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
