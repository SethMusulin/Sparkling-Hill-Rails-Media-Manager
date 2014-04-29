Rails.application.routes.draw do

  root 'welcome#index'



  get '/videos', to: 'videos#index'






  get '/pictures', to: 'pictures#index'

  get '/pictures/new', to: 'pictures#new'

  post '/pictures', to: 'pictures#create'

  get '/pictures/:id', to: 'pictures#show'




end
