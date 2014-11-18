Rails.application.routes.draw do

  get 'signin' => "sessions#new"

  resource :session

  get "signup" => "users#new"
  resources :users

  root "trucks#index"
  # get "trucks" => "trucks#index"
  # get "trucks/:id" => "trucks#show", as: "truck"
  # get "trucks/:id/edit" => "trucks#edit", as: "edit_truck"
  # patch "trucks/:id" => "trucks#update"

  resources :trucks do
  	resources :reviews
  end
end
