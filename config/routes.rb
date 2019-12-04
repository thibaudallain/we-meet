Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events, only: [:index, :new, :create, :edit, :update] do
    resources :meetings, only: [:index, :show, :new, :create, :edit, :update]
    get "/share", to: "events#share"
    get "/share-again", to: "events#share_again"
  end

  resources :events, only: [:show] do
    resources :suggested_bars, only: [:index]
    get "/suggested_bars/login", to: "suggested_bars#login"
  end
  get "/tanguy", to: "meetings#tanguy"
  get "/tanguycreate", to: "meetings#tanguycreate"
  get "/sergio", to: "meetings#sergio"
  get "/sergiocreate", to: "meetings#sergiocreate"
  get "/ade", to: "meetings#ade"
  get "/adecreate", to: "meetings#adecreate"
  mount ActionCable.server => "/cable"
end
