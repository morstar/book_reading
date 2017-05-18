Rails.application.routes.draw do
  devise_for :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :books, only: [:index, :show] do
  	resources :pages
  end
  
end
