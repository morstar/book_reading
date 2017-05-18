Rails.application.routes.draw do

  devise_for :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :books, only: [:index, :show] do
  	resources :pages
  end

  authenticated :book do
  	root 'books#dashboard', as: 'authenticated_root'
  end
  
  root 'welcome#index'

end
