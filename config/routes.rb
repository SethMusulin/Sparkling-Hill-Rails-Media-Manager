Rails.application.routes.draw do

  root 'welcome#index'

  get '/pictures', to: 'pictures#index'

  get '/videos', to: 'videos#index'

end
