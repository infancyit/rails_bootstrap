Rails.application.routes.draw do
  resources :people
  get '/people/:id/proceed', to: 'people#proceed', as: 'proceed'
  root to: 'people#new'
end
