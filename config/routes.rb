# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do
  end
 
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
  # root :to => "lists#index" *Rspec
  get '/index', to: 'lists#index'
  get '/lists', to: 'lists#index'
  get '/users', to: 'lists#index'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :lists
end
