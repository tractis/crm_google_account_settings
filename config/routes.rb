ActionController::Routing::Routes.draw do |map| 
  map.resources :google_accounts, :collection => { :settings => :post }
end