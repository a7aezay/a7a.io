Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations'}
    devise_scope :user do
      get 'login', to: 'devise/sessions#new'
    end
    devise_scope :user do
      get 'signup', to: 'devise/registrations#new'
    end
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  resources 'thoughts'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
