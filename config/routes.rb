Rails.application.routes.draw do
  get "/" => 'ships#index'
  get '/ships' => 'ships#index'
  get '/ships/new' => 'ships#new'
  post '/ships' => 'ships#create'
  get '/ships/:id' => 'ships#show'
  get '/ships/:id/edit' => 'ships#edit'
  patch '/ships/:id' => 'ships#update'
  delete '/ships/:id' => 'ships#destroy'

end
 