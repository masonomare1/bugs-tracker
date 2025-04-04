# frozen_string_literal: true

Rails.application.routes.draw do
  # TODO: why do we need a home controller, can't we directly use the projects controller
  root 'home#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :projects
  resources :projects do
    resources :bugs
  end

  get 'home/show'
  get '/project/:id/user', to: 'members#index', as: 'member'
  get '/project/:project_id/user/:user_id', to: 'members#create'
end
