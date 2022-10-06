Rails.application.routes.draw do

  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, controllers: {
  sessions: "admin/sessions"
}


  namespace :admin do
  resources :genres, only: [:index, :create, :destroy, :edit, :update,]
end



  scope module: :public do
  root to: "sceneries#index"
  get 'homes/about'
  resources :sceneries, only: [:index, :create, :show, :destroy, :edit, :update] do
    resources :scenery_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit] do
    member do
      get :favorites
    end
  end
  end

end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
