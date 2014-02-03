SampleApp::Application.routes.draw do
 
	resources :users          
	match '/', :to => 'static_pages#home'
 	match '/about', :to => 'static_pages#about'
 	match '/help', :to => 'static_pages#help'
 	match '/contact', :to => 'static_pages#contact'
 	match '/signup', :to => 'users#new'
 	match '/signin', :to => 'static_pages#signin'
	root :to => 'static_pages#home'
end
