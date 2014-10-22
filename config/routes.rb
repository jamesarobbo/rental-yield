Rails.application.routes.draw do
  
  root "properties#new"

  resources :properties, only: [:show, :create, :new]
  
  get "properties/:id/other_properties", to: "properties#other_properties", as: :other_properties

  get "*path", to: redirect('/')

end
