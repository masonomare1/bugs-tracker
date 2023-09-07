# frozen_string_literal: true

Rails.application.routes.draw do
  resources :projects
  root 'home#index'
  get 'home/show'
  post 'home/create'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
end
