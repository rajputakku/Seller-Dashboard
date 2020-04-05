Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
  namespace :v1 do
   resources :clients do
   	resources :clientusers, controller: 'client_users'
   end
   post 'auth/login', to: 'client_users#login'
   get 'test', to: 'client_users#test'
  end
 end
end
