Rails.application.routes.draw do
  
  resources :groups do
  	resources :students
  	resources :subjects do 
  		resources :lessons
  	end
  end

  devise_for :users
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "welcome#index"
end
