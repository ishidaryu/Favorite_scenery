Rails.application.routes.draw do

  get 'relationships/followings'
  get 'relationships/followers'
  get 'sceneries/index'
  get 'sceneries/show'
  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


  devise_for :admin, controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
  root to: "users#index"
  resources :genres, only: [:index, :create, :destroy, :edit, :update,]
  resources :sceneries, only: [:index, :create, :show, :destroy, :edit, :update] do
    resources :scenery_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :destroy]
end



  resources :contacts, only: [:new, :create]
  scope module: :public do
  root to: 'homes#top'
  get 'homes/about'
  get "search" => "searches#search"
  resources :genres, only: [:show]
  post '/sceneries/create', to: 'sceneries#create'
  resources :sceneries, only: [:index, :create, :show, :destroy, :edit, :update] do
    resources :scenery_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
    devise_scope :user do
      post 'users/guest_sign_in', to: 'sessions#guest_sign_in'
  end
  resources :users, only: [:show, :edit] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    member do
      get :favorites
    end
  end
  end

end