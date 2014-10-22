Rails.application.routes.draw do
  
  root "properties#new"
  resources :properties

  get "properties/:id/other_properties", to: "properties#other_properties", as: :other_properties


end
