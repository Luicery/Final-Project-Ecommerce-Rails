Rails.application.routes.draw do
  resources :carts
  resources :wishlists
  post 'user_token' => 'user_token#create'
  resources :reviews
  resources :images
  resources :items, except: [:create]
  resources :carts, except: [:update, :destroy]
  resources :wishlists, except: [:update, :destroy]
  get '/profile' => 'users#show'
  resources :users, except: [:show]
  post "/itemwish" => "items#createWish"
  post "/itemcart" => "items#createCart"
  post "/itemwishdelete" => "items#removeWish"
  post "/itemcartdelete" => "items#removeCart"
  post "/emptycart" => "items#empty"
  get "/updateCart" => "carts#update"
  get "/updateWish" => "wishlists#update"
  get "/destroyWish" => "wishlists#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
