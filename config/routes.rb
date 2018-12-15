Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do

      resources :users
      post '/login', to: 'users#login'
      post '/signup', to: 'users#signup'
      get '/validate', to: 'users#validate'

      resources :stocks
      resources :user_stocks
      resources :notes
      post '/get_user_notes', to: 'notes#get_user_notes'

      resources :news_apis
      post '/search_news', to: 'news_apis#search_news'
    
    end 
  end 

end
