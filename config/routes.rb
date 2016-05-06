Rails.application.routes.draw do
  devise_for :users
  get '/'=> 'ships#index'
  get "/" => 'ships#index'
  get '/ships' => 'ships#index'
  get '/ships/new' => 'ships#new'
  post '/ships' => 'ships#create'
  get '/ships/:id' => 'ships#show'
  get '/ships/:id/edit' => 'ships#edit'
  patch '/ships/:id' => 'ships#update'
  delete '/ships/:id' => 'ships#destroy'

  post '/carted_products' => 'carted_products#create'
  get '/carted_products/:id' => 'carted_products#show'

  post "/search" => 'products#run_search'

  post '/orders' => 'orders#create'
  get '/orders/:id' => 'orders#show'
end