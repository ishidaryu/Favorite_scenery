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
  resources :genres, only: [:index, :create, :destroy, :edit, :update,]
  resources :sceneries, only: [:index, :show, :destroy]
  resources :users, only: [:index, :show, :destroy]
end



  scope module: :public do
  root to: 'homes#top'
  get 'homes/about'
  get "search" => "searches#search"
  post '/guests/guest_sign_in', to: 'guests#new_guest'
  resources :genres, only: [:show]
  post '/sceneries/create', to: 'sceneries#create'
  resources :sceneries, only: [:index, :create, :show, :destroy, :edit, :update] do
    resources :scenery_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
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