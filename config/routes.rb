Rails.application.routes.draw do
  
	root 'projects#index'
  	devise_for :users
  	resources :projects
  	resources :bugs do
  		member do
  			get :assign
  			get :assigned
  		end
  	end
end
