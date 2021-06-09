Rails.application.routes.draw do
  
  devise_for :users, path: '', path_names: { sign_in: 'Login', sign_out: 'Logout', sign_up: 'register'}
  resources :matrimonies do
    resources :comments
  end
  get 'about', to: 'page#about'
  get 'contact', to: 'page#contact'
  resources :guides
  root to: 'page#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
