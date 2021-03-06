SampleApp::Application.routes.draw do
	resources :users do
        member do
            get :following, :followers
        end
    end
	resources :sessions, :only => [:new, :create, :destroy] 
    resources :microposts, :only => [:create, :destroy]
    resources :relationships, :only => [:create, :destroy]
	match '/signout', :to => 'sessions#destroy', :via => :delete
	match '/', :to => 'static_pages#home'
 	match '/about', :to => 'static_pages#about'
 	match '/help', :to => 'static_pages#help'
 	match '/contact', :to => 'static_pages#contact'
 	match '/signup', :to => 'users#new'
 	match '/signin', :to => 'sessions#new'
    match '/edit_user', :to => 'users#edit'
	root :to => 'static_pages#home'
end
