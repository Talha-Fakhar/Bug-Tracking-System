Rails.application.routes.draw do
  resources :projects do
    resources :bugs do
      member do
        patch :assign
      end
    end
  end
  get 'home', to: 'pages#home', as: 'home'
  # config/routes.rb
patch '/projects/:project_id/bugs/:id/assign', to: 'bugs#assign', as: 'assign_bug'


  devise_for :users
  root to: "pages#home"
end
