Rails.application.routes.draw do


  root "trucks#index"
  # get "trucks" => "trucks#index"
  # get "trucks/:id" => "trucks#show", as: "truck"
  # get "trucks/:id/edit" => "trucks#edit", as: "edit_truck"
  # patch "trucks/:id" => "trucks#update"

  resources :trucks do
  	resources :reviews
  end
end
