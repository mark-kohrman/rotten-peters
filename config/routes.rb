Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/movies" => "movies#index"
    post "/movies" => "movies#create"
    get "/movies/:id" => "movies#show"
    patch "/movies/:id" => "movies#update"
    delete "/movies/:id" => "movies#destroy"

    
    post "/searches" => "searches#index"
    get "/searches/:id" => "searches#show"



  end

  root 'application#index'
  get '/*path', to: 'application#index'
end
