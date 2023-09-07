# frozen_string_literal: true

Rails.application.routes.draw do
  resources :projects
  root 'home#index'
  get 'home/show'

  get '/project/:id/user', to: 'members#index', as: 'member'
  get '/project/:project_id/user/:user_id', to: 'members#create'

  resources :projects do
    resources :bugs
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
end
