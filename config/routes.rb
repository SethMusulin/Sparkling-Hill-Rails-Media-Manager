Rails.application.routes.draw do

  root 'welcome#index'

  resources :videos
  resources :pictures

end
