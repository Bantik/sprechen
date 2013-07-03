Sprechen::Application.routes.draw do

  get '/auth/:provider/callback' => "sessions#create"

  match '/sign_out' => "sessions#destroy", :as => 'sign_out'

  resources :topics

  namespace :conferences do
    resources :search, :only => [:new, :create, :show], :controller => "search"
  end

  namespace :speaker, :path => 'speaker/:user/' do
    resource :calendar
    resource :dashboard
    resources :bios
    resources :talks
  end

  root :to => 'home#index'

end
