Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  
  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  
  devise_for :admin, controllers: {
  sessions: "admin/sessions"
}


  namespace :admin do
  get 'genres/new'
end



  scope module: :public do
  get 'sceneries/index'
  end 
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
