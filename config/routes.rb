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
  get "/search", to: "events#search"
  mount ActionCable.server => "/cable"
end
