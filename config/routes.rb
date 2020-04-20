Rails.application.routes.draw do
  
  resources :groups do
  	resources :students do
      member do
        delete '/delete_image/:image_id', to: "students#delete_image", as: :delete_image
      end
    end
  	resources :subjects do 
  		resources :lessons do
        get :live
      end
  	end
  end

  devise_for :users
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "welcome#index"
end
