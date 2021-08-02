Rails.application.routes.draw do
  resources :abilities
  resources :wizards
  resources :monsters
  resources :battles
  post "/battles/:monster_id/:wizard_id", to: "battles#battle"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
